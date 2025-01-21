#!/bin/bash
# Set strict error handling
set -euo pipefail
# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Logging function
log() {
    local level="$1"
    local message="$2"
    local color=""

    case "$level" in
    "error") color=$RED ;;
    "success") color=$GREEN ;;
    "warn") color=$YELLOW ;;
    *) color=$NC ;;
    esac

    echo -e "${color}${message}${NC}" >&2
}

# Check dependencies
check_dependencies() {
    local dependencies=("curl" "ping" "awk" "sort" "grep" "xargs" "column" "nmcli" "cat")
    for cmd in "${dependencies[@]}"; do
        if ! command -v "$cmd" &>/dev/null; then
            log "error" "$cmd is not installed. Please install it and try again."
            exit 1
        fi
    done
}

# Find default DNS server from system configuration
find_default_dns() {
    local default_dns=""

    # Try multiple methods to find default DNS
    # 1. Try NetworkManager
    if command -v nmcli &>/dev/null; then
        default_dns=$(nmcli dev show | grep DNS | awk '{print $2}' | head -n 1)
    fi

    # 2. Try resolv.conf
    if [ -z "$default_dns" ] && [ -f /etc/resolv.conf ]; then
        default_dns=$(grep "^nameserver" /etc/resolv.conf | awk '{print $2}' | head -n 1)
    fi

    # 3. Fallback to common default DNS
    if [ -z "$default_dns" ]; then
        log "warn" "Could not automatically detect ISP's default DNS. Using common default."
        default_dns=$(ip route | awk '/default/ {print $3}' | head -n 1)
    fi

    # Validate DNS is not empty and is a valid IP
    if [[ -z "$default_dns" || ! "$default_dns" =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
        log "error" "Failed to find a valid default DNS server."
        return 1
    fi

    echo "$default_dns"
}

# Fetch DNS servers from multiple sources with fallback
fetch_dns_servers() {
    local sources=(
        "https://raw.githubusercontent.com/trickest/resolvers/refs/heads/main/resolvers-trusted.txt"
        "https://www.publicdns.xyz/" # backup source
    )

    local DNS_LIST=""
    for source in "${sources[@]}"; do
        log "warn" "Fetching DNS servers from $source...\n"
        DNS_LIST=$(curl -s --max-time 10 "$source" | grep -Eo '([0-9]{1,3}\.){3}[0-9]{1,3}' | grep -v '^0\.' | sort -u)

        if [ -n "$DNS_LIST" ]; then
            break
        fi
    done

    if [ -z "$DNS_LIST" ]; then
        log "error" "Failed to fetch DNS servers from all sources. Using fallback list."
        DNS_LIST="1.1.1.1 8.8.8.8 9.9.9.9 208.67.222.222 64.6.64.6 1.0.0.1 149.112.112.112 94.140.15.15 8.8.4.4 76.76.2.0 208.67.220.220 64.6.65.6"
    fi

    echo "$DNS_LIST"
}

# Perform DNS latency test using xargs
test_dns_servers() {
    local DNS_LIST="$1"
    local DEFAULT_DNS="$2"
    local RESULT_FILE
    RESULT_FILE=$(mktemp)

    log "warn" "Testing DNS servers. This may take a moment...\n"

    # Include default DNS in the list and test
    local FULL_DNS_LIST="$DEFAULT_DNS $DNS_LIST"

    # Use xargs for concurrent testing
    echo "$FULL_DNS_LIST" | tr ' ' '\n' | sort -u | xargs -I {} -P 64 sh -c '
        PING_RESULT=$(ping -c 10 -i 0.1 -W 0.3 -q {} 2>/dev/null | grep "rtt min/avg/max/mdev" | awk -F"/" "{print \$5}")
        if [ -n "$PING_RESULT" ]; then
            echo "$PING_RESULT {}"
        fi
    ' >"$RESULT_FILE"

    echo "$RESULT_FILE"
}

# Format results in a table
format_results() {
    local RESULT_FILE="$1"
    local DEFAULT_DNS="$2"

    # Print table header with precise formatting
    log "success" "DNS Server Latency Test Results:"
    printf "+----+-----------------+------------+-------------+\n"
    printf "| No | DNS IP          | Ping       | Server Type |\n"
    printf "+----+-----------------+------------+-------------+\n"

    # Sort numerically and format with precise alignment
    # Highlight the default DNS with a special marker
    sort -k1,1n "$RESULT_FILE" | awk -v default_dns="$DEFAULT_DNS" '{
        server_type = ($2 == default_dns) ? "ISP Default" : "Public"
        printf "| %2d | %-15s | %7.3f ms | %-11s |\n", NR, $2, $1, server_type
    }' | head -n 64

    # Close the table
    printf "+----+-----------------+------------+-------------+\n"
}

# Main script execution
main() {
    # Validate dependencies
    check_dependencies

    # Find default DNS
    DEFAULT_DNS=$(find_default_dns)
    log "warn" "Detected ISP Default DNS: $DEFAULT_DNS\n"

    # Fetch DNS servers
    DNS_LIST=$(fetch_dns_servers)

    # Test DNS servers including default
    RESULT_FILE=$(test_dns_servers "$DNS_LIST" "$DEFAULT_DNS")

    # Display formatted results
    format_results "$RESULT_FILE" "$DEFAULT_DNS"

    # Clean up
    rm "$RESULT_FILE"
}

# Run the script
main
