; PHP
((text) @injection.content
    (#not-has-ancestor? @injection.content "envoy")
    (#set! injection.combined)
    (#set! injection.language php))

; Parameter
((parameter) @injection.content
   (#set! injection.language php_only))

; Bash
((text) @injection.content
   (#has-ancestor? @injection.content "envoy")
   (#set! injection.combined)
   (#set! injection.language bash))

