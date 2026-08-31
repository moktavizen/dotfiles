Port this theme to neovim

Make it as accurate as possible

```
cat ~/.vscode/extensions/github.github-vscode-theme-6.3.5/themes/dark-default.json
{
  "name": "GitHub Dark Default",
  "colors": {
    "focusBorder": "#1f6feb",
    "foreground": "#e6edf3",
    "descriptionForeground": "#7d8590",
    "errorForeground": "#f85149",
    "textLink.foreground": "#2f81f7",
    "textLink.activeForeground": "#2f81f7",
    "textBlockQuote.background": "#010409",
    "textBlockQuote.border": "#30363d",
    "textCodeBlock.background": "#6e768166",
    "textPreformat.foreground": "#7d8590",
    "textPreformat.background": "#6e768166",
    "textSeparator.foreground": "#21262d",
    "icon.foreground": "#7d8590",
    "keybindingLabel.foreground": "#e6edf3",
    "button.background": "#238636",
    "button.foreground": "#ffffff",
    "button.hoverBackground": "#2ea043",
    "button.secondaryBackground": "#282e33",
    "button.secondaryForeground": "#c9d1d9",
    "button.secondaryHoverBackground": "#30363d",
    "checkbox.background": "#161b22",
    "checkbox.border": "#30363d",
    "dropdown.background": "#161b22",
    "dropdown.border": "#30363d",
    "dropdown.foreground": "#e6edf3",
    "dropdown.listBackground": "#161b22",
    "input.background": "#0d1117",
    "input.border": "#30363d",
    "input.foreground": "#e6edf3",
    "input.placeholderForeground": "#6e7681",
    "badge.foreground": "#ffffff",
    "badge.background": "#1f6feb",
    "progressBar.background": "#1f6feb",
    "titleBar.activeForeground": "#7d8590",
    "titleBar.activeBackground": "#0d1117",
    "titleBar.inactiveForeground": "#7d8590",
    "titleBar.inactiveBackground": "#010409",
    "titleBar.border": "#30363d",
    "activityBar.foreground": "#e6edf3",
    "activityBar.inactiveForeground": "#7d8590",
    "activityBar.background": "#0d1117",
    "activityBarBadge.foreground": "#ffffff",
    "activityBarBadge.background": "#1f6feb",
    "activityBar.activeBorder": "#f78166",
    "activityBar.border": "#30363d",
    "sideBar.foreground": "#e6edf3",
    "sideBar.background": "#010409",
    "sideBar.border": "#30363d",
    "sideBarTitle.foreground": "#e6edf3",
    "sideBarSectionHeader.foreground": "#e6edf3",
    "sideBarSectionHeader.background": "#010409",
    "sideBarSectionHeader.border": "#30363d",
    "list.hoverForeground": "#e6edf3",
    "list.inactiveSelectionForeground": "#e6edf3",
    "list.activeSelectionForeground": "#e6edf3",
    "list.hoverBackground": "#6e76811a",
    "list.inactiveSelectionBackground": "#6e768166",
    "list.activeSelectionBackground": "#6e768166",
    "list.focusForeground": "#e6edf3",
    "list.focusBackground": "#388bfd26",
    "list.inactiveFocusBackground": "#388bfd26",
    "list.highlightForeground": "#2f81f7",
    "tree.indentGuidesStroke": "#21262d",
    "notificationCenterHeader.foreground": "#7d8590",
    "notificationCenterHeader.background": "#161b22",
    "notifications.foreground": "#e6edf3",
    "notifications.background": "#161b22",
    "notifications.border": "#30363d",
    "notificationsErrorIcon.foreground": "#f85149",
    "notificationsWarningIcon.foreground": "#d29922",
    "notificationsInfoIcon.foreground": "#2f81f7",
    "pickerGroup.border": "#30363d",
    "pickerGroup.foreground": "#7d8590",
    "quickInput.background": "#161b22",
    "quickInput.foreground": "#e6edf3",
    "statusBar.foreground": "#7d8590",
    "statusBar.background": "#0d1117",
    "statusBar.border": "#30363d",
    "statusBar.focusBorder": "#1f6feb80",
    "statusBar.noFolderBackground": "#0d1117",
    "statusBar.debuggingForeground": "#ffffff",
    "statusBar.debuggingBackground": "#da3633",
    "statusBarItem.prominentBackground": "#6e768166",
    "statusBarItem.remoteForeground": "#e6edf3",
    "statusBarItem.remoteBackground": "#30363d",
    "statusBarItem.hoverBackground": "#e6edf314",
    "statusBarItem.activeBackground": "#e6edf31f",
    "statusBarItem.focusBorder": "#1f6feb",
    "editorGroupHeader.tabsBackground": "#010409",
    "editorGroupHeader.tabsBorder": "#30363d",
    "editorGroup.border": "#30363d",
    "tab.activeForeground": "#e6edf3",
    "tab.inactiveForeground": "#7d8590",
    "tab.inactiveBackground": "#010409",
    "tab.activeBackground": "#0d1117",
    "tab.hoverBackground": "#0d1117",
    "tab.unfocusedHoverBackground": "#6e76811a",
    "tab.border": "#30363d",
    "tab.unfocusedActiveBorderTop": "#30363d",
    "tab.activeBorder": "#0d1117",
    "tab.unfocusedActiveBorder": "#0d1117",
    "tab.activeBorderTop": "#f78166",
    "breadcrumb.foreground": "#7d8590",
    "breadcrumb.focusForeground": "#e6edf3",
    "breadcrumb.activeSelectionForeground": "#7d8590",
    "breadcrumbPicker.background": "#161b22",
    "editor.foreground": "#e6edf3",
    "editor.background": "#0d1117",
    "editorWidget.background": "#161b22",
    "editor.foldBackground": "#6e76811a",
    "editor.lineHighlightBackground": "#6e76811a",
    "editorLineNumber.foreground": "#6e7681",
    "editorLineNumber.activeForeground": "#e6edf3",
    "editorIndentGuide.background": "#e6edf31f",
    "editorIndentGuide.activeBackground": "#e6edf33d",
    "editorWhitespace.foreground": "#484f58",
    "editorCursor.foreground": "#2f81f7",
    "editor.findMatchBackground": "#9e6a03",
    "editor.findMatchHighlightBackground": "#f2cc6080",
    "editor.linkedEditingBackground": "#2f81f712",
    "editor.selectionHighlightBackground": "#3fb95040",
    "editor.wordHighlightBackground": "#6e768180",
    "editor.wordHighlightBorder": "#6e768199",
    "editor.wordHighlightStrongBackground": "#6e76814d",
    "editor.wordHighlightStrongBorder": "#6e768199",
    "editorBracketMatch.background": "#3fb95040",
    "editorBracketMatch.border": "#3fb95099",
    "editorInlayHint.background": "#8b949e33",
    "editorInlayHint.foreground": "#7d8590",
    "editorInlayHint.typeBackground": "#8b949e33",
    "editorInlayHint.typeForeground": "#7d8590",
    "editorInlayHint.paramBackground": "#8b949e33",
    "editorInlayHint.paramForeground": "#7d8590",
    "editorGutter.modifiedBackground": "#bb800966",
    "editorGutter.addedBackground": "#2ea04366",
    "editorGutter.deletedBackground": "#f8514966",
    "diffEditor.insertedLineBackground": "#23863626",
    "diffEditor.insertedTextBackground": "#3fb9504d",
    "diffEditor.removedLineBackground": "#da363326",
    "diffEditor.removedTextBackground": "#ff7b724d",
    "scrollbar.shadow": "#484f5833",
    "scrollbarSlider.background": "#8b949e33",
    "scrollbarSlider.hoverBackground": "#8b949e3d",
    "scrollbarSlider.activeBackground": "#8b949e47",
    "editorOverviewRuler.border": "#010409",
    "minimapSlider.background": "#8b949e33",
    "minimapSlider.hoverBackground": "#8b949e3d",
    "minimapSlider.activeBackground": "#8b949e47",
    "panel.background": "#010409",
    "panel.border": "#30363d",
    "panelTitle.activeBorder": "#f78166",
    "panelTitle.activeForeground": "#e6edf3",
    "panelTitle.inactiveForeground": "#7d8590",
    "panelInput.border": "#30363d",
    "debugIcon.breakpointForeground": "#f85149",
    "debugConsole.infoForeground": "#8b949e",
    "debugConsole.warningForeground": "#d29922",
    "debugConsole.errorForeground": "#ffa198",
    "debugConsole.sourceForeground": "#e3b341",
    "debugConsoleInputIcon.foreground": "#bc8cff",
    "debugTokenExpression.name": "#79c0ff",
    "debugTokenExpression.value": "#a5d6ff",
    "debugTokenExpression.string": "#a5d6ff",
    "debugTokenExpression.boolean": "#56d364",
    "debugTokenExpression.number": "#56d364",
    "debugTokenExpression.error": "#ffa198",
    "symbolIcon.arrayForeground": "#f0883e",
    "symbolIcon.booleanForeground": "#58a6ff",
    "symbolIcon.classForeground": "#f0883e",
    "symbolIcon.colorForeground": "#79c0ff",
    "symbolIcon.constructorForeground": "#d2a8ff",
    "symbolIcon.enumeratorForeground": "#f0883e",
    "symbolIcon.enumeratorMemberForeground": "#58a6ff",
    "symbolIcon.eventForeground": "#6e7681",
    "symbolIcon.fieldForeground": "#f0883e",
    "symbolIcon.fileForeground": "#d29922",
    "symbolIcon.folderForeground": "#d29922",
    "symbolIcon.functionForeground": "#bc8cff",
    "symbolIcon.interfaceForeground": "#f0883e",
    "symbolIcon.keyForeground": "#58a6ff",
    "symbolIcon.keywordForeground": "#ff7b72",
    "symbolIcon.methodForeground": "#bc8cff",
    "symbolIcon.moduleForeground": "#ff7b72",
    "symbolIcon.namespaceForeground": "#ff7b72",
    "symbolIcon.nullForeground": "#58a6ff",
    "symbolIcon.numberForeground": "#3fb950",
    "symbolIcon.objectForeground": "#f0883e",
    "symbolIcon.operatorForeground": "#79c0ff",
    "symbolIcon.packageForeground": "#f0883e",
    "symbolIcon.propertyForeground": "#f0883e",
    "symbolIcon.referenceForeground": "#58a6ff",
    "symbolIcon.snippetForeground": "#58a6ff",
    "symbolIcon.stringForeground": "#79c0ff",
    "symbolIcon.structForeground": "#f0883e",
    "symbolIcon.textForeground": "#79c0ff",
    "symbolIcon.typeParameterForeground": "#79c0ff",
    "symbolIcon.unitForeground": "#58a6ff",
    "symbolIcon.variableForeground": "#f0883e",
    "symbolIcon.constantForeground": [
      "#aff5b4",
      "#7ee787",
      "#56d364",
      "#3fb950",
      "#2ea043",
      "#238636",
      "#196c2e",
      "#0f5323",
      "#033a16",
      "#04260f"
    ],
    "terminal.foreground": "#e6edf3",
    "terminal.ansiBlack": "#484f58",
    "terminal.ansiRed": "#ff7b72",
    "terminal.ansiGreen": "#3fb950",
    "terminal.ansiYellow": "#d29922",
    "terminal.ansiBlue": "#58a6ff",
    "terminal.ansiMagenta": "#bc8cff",
    "terminal.ansiCyan": "#39c5cf",
    "terminal.ansiWhite": "#b1bac4",
    "terminal.ansiBrightBlack": "#6e7681",
    "terminal.ansiBrightRed": "#ffa198",
    "terminal.ansiBrightGreen": "#56d364",
    "terminal.ansiBrightYellow": "#e3b341",
    "terminal.ansiBrightBlue": "#79c0ff",
    "terminal.ansiBrightMagenta": "#d2a8ff",
    "terminal.ansiBrightCyan": "#56d4dd",
    "terminal.ansiBrightWhite": "#ffffff",
    "editorBracketHighlight.foreground1": "#79c0ff",
    "editorBracketHighlight.foreground2": "#56d364",
    "editorBracketHighlight.foreground3": "#e3b341",
    "editorBracketHighlight.foreground4": "#ffa198",
    "editorBracketHighlight.foreground5": "#ff9bce",
    "editorBracketHighlight.foreground6": "#d2a8ff",
    "editorBracketHighlight.unexpectedBracket.foreground": "#7d8590",
    "gitDecoration.addedResourceForeground": "#3fb950",
    "gitDecoration.modifiedResourceForeground": "#d29922",
    "gitDecoration.deletedResourceForeground": "#f85149",
    "gitDecoration.untrackedResourceForeground": "#3fb950",
    "gitDecoration.ignoredResourceForeground": "#6e7681",
    "gitDecoration.conflictingResourceForeground": "#db6d28",
    "gitDecoration.submoduleResourceForeground": "#7d8590",
    "debugToolBar.background": "#161b22",
    "editor.stackFrameHighlightBackground": "#bb800966",
    "editor.focusedStackFrameHighlightBackground": "#2ea04366",
    "peekViewEditor.matchHighlightBackground": "#bb800966",
    "peekViewResult.matchHighlightBackground": "#bb800966",
    "peekViewEditor.background": "#6e76811a",
    "peekViewResult.background": "#0d1117",
    "settings.headerForeground": "#e6edf3",
    "settings.modifiedItemIndicator": "#bb800966",
    "welcomePage.buttonBackground": "#21262d",
    "welcomePage.buttonHoverBackground": "#30363d"
  },
  "semanticHighlighting": true,
  "tokenColors": [
    {
      "scope": [
        "comment",
        "punctuation.definition.comment",
        "string.comment"
      ],
      "settings": {
        "foreground": "#8b949e"
      }
    },
    {
      "scope": [
        "constant.other.placeholder",
        "constant.character"
      ],
      "settings": {
        "foreground": "#ff7b72"
      }
    },
    {
      "scope": [
        "constant",
        "entity.name.constant",
        "variable.other.constant",
        "variable.other.enummember",
        "variable.language",
        "entity"
      ],
      "settings": {
        "foreground": "#79c0ff"
      }
    },
    {
      "scope": [
        "entity.name",
        "meta.export.default",
        "meta.definition.variable"
      ],
      "settings": {
        "foreground": "#ffa657"
      }
    },
    {
      "scope": [
        "variable.parameter.function",
        "meta.jsx.children",
        "meta.block",
        "meta.tag.attributes",
        "entity.name.constant",
        "meta.object.member",
        "meta.embedded.expression"
      ],
      "settings": {
        "foreground": "#e6edf3"
      }
    },
    {
      "scope": "entity.name.function",
      "settings": {
        "foreground": "#d2a8ff"
      }
    },
    {
      "scope": [
        "entity.name.tag",
        "support.class.component"
      ],
      "settings": {
        "foreground": "#7ee787"
      }
    },
    {
      "scope": "keyword",
      "settings": {
        "foreground": "#ff7b72"
      }
    },
    {
      "scope": [
        "storage",
        "storage.type"
      ],
      "settings": {
        "foreground": "#ff7b72"
      }
    },
    {
      "scope": [
        "storage.modifier.package",
        "storage.modifier.import",
        "storage.type.java"
      ],
      "settings": {
        "foreground": "#e6edf3"
      }
    },
    {
      "scope": [
        "string",
        "string punctuation.section.embedded source"
      ],
      "settings": {
        "foreground": "#a5d6ff"
      }
    },
    {
      "scope": "support",
      "settings": {
        "foreground": "#79c0ff"
      }
    },
    {
      "scope": "meta.property-name",
      "settings": {
        "foreground": "#79c0ff"
      }
    },
    {
      "scope": "variable",
      "settings": {
        "foreground": "#ffa657"
      }
    },
    {
      "scope": "variable.other",
      "settings": {
        "foreground": "#e6edf3"
      }
    },
    {
      "scope": "invalid.broken",
      "settings": {
        "fontStyle": "italic",
        "foreground": "#ffa198"
      }
    },
    {
      "scope": "invalid.deprecated",
      "settings": {
        "fontStyle": "italic",
        "foreground": "#ffa198"
      }
    },
    {
      "scope": "invalid.illegal",
      "settings": {
        "fontStyle": "italic",
        "foreground": "#ffa198"
      }
    },
    {
      "scope": "invalid.unimplemented",
      "settings": {
        "fontStyle": "italic",
        "foreground": "#ffa198"
      }
    },
    {
      "scope": "carriage-return",
      "settings": {
        "fontStyle": "italic underline",
        "background": "#ff7b72",
        "foreground": "#f0f6fc",
        "content": "^M"
      }
    },
    {
      "scope": "message.error",
      "settings": {
        "foreground": "#ffa198"
      }
    },
    {
      "scope": "string variable",
      "settings": {
        "foreground": "#79c0ff"
      }
    },
    {
      "scope": [
        "source.regexp",
        "string.regexp"
      ],
      "settings": {
        "foreground": "#a5d6ff"
      }
    },
    {
      "scope": [
        "string.regexp.character-class",
        "string.regexp constant.character.escape",
        "string.regexp source.ruby.embedded",
        "string.regexp string.regexp.arbitrary-repitition"
      ],
      "settings": {
        "foreground": "#a5d6ff"
      }
    },
    {
      "scope": "string.regexp constant.character.escape",
      "settings": {
        "fontStyle": "bold",
        "foreground": "#7ee787"
      }
    },
    {
      "scope": "support.constant",
      "settings": {
        "foreground": "#79c0ff"
      }
    },
    {
      "scope": "support.variable",
      "settings": {
        "foreground": "#79c0ff"
      }
    },
    {
      "scope": "support.type.property-name.json",
      "settings": {
        "foreground": "#7ee787"
      }
    },
    {
      "scope": "meta.module-reference",
      "settings": {
        "foreground": "#79c0ff"
      }
    },
    {
      "scope": "punctuation.definition.list.begin.markdown",
      "settings": {
        "foreground": "#ffa657"
      }
    },
    {
      "scope": [
        "markup.heading",
        "markup.heading entity.name"
      ],
      "settings": {
        "fontStyle": "bold",
        "foreground": "#79c0ff"
      }
    },
    {
      "scope": "markup.quote",
      "settings": {
        "foreground": "#7ee787"
      }
    },
    {
      "scope": "markup.italic",
      "settings": {
        "fontStyle": "italic",
        "foreground": "#e6edf3"
      }
    },
    {
      "scope": "markup.bold",
      "settings": {
        "fontStyle": "bold",
        "foreground": "#e6edf3"
      }
    },
    {
      "scope": [
        "markup.underline"
      ],
      "settings": {
        "fontStyle": "underline"
      }
    },
    {
      "scope": [
        "markup.strikethrough"
      ],
      "settings": {
        "fontStyle": "strikethrough"
      }
    },
    {
      "scope": "markup.inline.raw",
      "settings": {
        "foreground": "#79c0ff"
      }
    },
    {
      "scope": [
        "markup.deleted",
        "meta.diff.header.from-file",
        "punctuation.definition.deleted"
      ],
      "settings": {
        "background": "#490202",
        "foreground": "#ffa198"
      }
    },
    {
      "scope": [
        "punctuation.section.embedded"
      ],
      "settings": {
        "foreground": "#ff7b72"
      }
    },
    {
      "scope": [
        "markup.inserted",
        "meta.diff.header.to-file",
        "punctuation.definition.inserted"
      ],
      "settings": {
        "background": "#04260f",
        "foreground": "#7ee787"
      }
    },
    {
      "scope": [
        "markup.changed",
        "punctuation.definition.changed"
      ],
      "settings": {
        "background": "#5a1e02",
        "foreground": "#ffa657"
      }
    },
    {
      "scope": [
        "markup.ignored",
        "markup.untracked"
      ],
      "settings": {
        "foreground": "#161b22",
        "background": "#79c0ff"
      }
    },
    {
      "scope": "meta.diff.range",
      "settings": {
        "foreground": "#d2a8ff",
        "fontStyle": "bold"
      }
    },
    {
      "scope": "meta.diff.header",
      "settings": {
        "foreground": "#79c0ff"
      }
    },
    {
      "scope": "meta.separator",
      "settings": {
        "fontStyle": "bold",
        "foreground": "#79c0ff"
      }
    },
    {
      "scope": "meta.output",
      "settings": {
        "foreground": "#79c0ff"
      }
    },
    {
      "scope": [
        "brackethighlighter.tag",
        "brackethighlighter.curly",
        "brackethighlighter.round",
        "brackethighlighter.square",
        "brackethighlighter.angle",
        "brackethighlighter.quote"
      ],
      "settings": {
        "foreground": "#8b949e"
      }
    },
    {
      "scope": "brackethighlighter.unmatched",
      "settings": {
        "foreground": "#ffa198"
      }
    },
    {
      "scope": [
        "constant.other.reference.link",
        "string.other.link"
      ],
      "settings": {
        "foreground": "#a5d6ff"
      }
    }
  ]
}
```

---

Here is the neovim docs

```
NAMING CONVENTIONS		    *group-name* *{group-name}* *E669* *E5248*

A syntax group name is to be used for syntax items that match the same kind of
thing.  These are then linked to a highlight group that specifies the color.
A syntax group name doesn't specify any color or attributes itself.

The name for a highlight or syntax group must consist of ASCII letters,
digits, underscores, dots, hyphens, or `@`.  As a regexp: `[a-zA-Z0-9_.@-]*`.
The maximum length of a group name is about 200 bytes.  *E1249*

To be able to allow each user to pick their favorite set of colors, there must
be preferred names for highlight groups that are common for many languages.
These are the suggested group names (if syntax highlighting works properly
you can see the actual color, except for "Ignore"):

Comment		any comment

Constant	any constant
String		a string constant: "this is a string"
Character	a character constant: 'c', '\n'
Number		a number constant: 234, 0xff
Boolean		a boolean constant: TRUE, false
Float		a floating point constant: 2.3e10

Identifier	any variable name
Function	function name (also: methods for classes)

Statement	any statement
Conditional	if, then, else, endif, switch, etc.
Repeat		for, do, while, etc.
Label		case, default, etc.
Operator	"sizeof", "+", "*", etc.
Keyword		any other keyword
Exception	try, catch, throw

PreProc		generic Preprocessor
Include		preprocessor #include
Define		preprocessor #define
Macro		same as Define
PreCondit	preprocessor #if, #else, #endif, etc.

Type		int, long, char, etc.
StorageClass	static, register, volatile, etc.
Structure	struct, union, enum, etc.
Typedef		a typedef

Special		any special symbol
SpecialChar	special character in a constant
Tag		you can use CTRL-] on this
Delimiter	character that needs attention
SpecialComment	special things inside a comment
Debug		debugging statements

Underlined	text that stands out, HTML links

Ignore		left blank, hidden  |hl-Ignore|

Error		any erroneous construct

Todo		anything that needs extra attention; mostly the
		keywords TODO FIXME and XXX

Added		added line in a diff
Changed		changed line in a diff
Removed		removed line in a diff

Note that highlight group names are not case sensitive.  "String" and "string"
can be used for the same group.

The following names are reserved and cannot be used as a group name:
	NONE   ALL   ALLBUT   contains	 contained

                                                 *treesitter-highlight-groups*
The capture names, prefixed with `@`, are directly usable as highlight groups.
For many commonly used captures, the corresponding highlight groups are linked
to Nvim's standard |highlight-groups| by default (e.g., `@comment` links to
`Comment`) but can be overridden in colorschemes.

A fallback system is implemented, so that more specific groups fallback to
more generic ones. For instance, in a language that has separate doc comments
(e.g., c, java, etc.), `@comment.documentation` could be used. If this group
is not defined, the highlighting for an ordinary `@comment` is used. This way,
existing color schemes already work out of the box, but it is possible to add
more specific variants for queries that make them available.

As an additional rule, capture highlights can always be specialized by
language, by appending the language name after an additional dot. For
instance, to highlight comments differently per language: >vim

    hi @comment.c guifg=Blue
    hi @comment.lua guifg=DarkBlue
    hi link @comment.documentation.java String
<
The following is a list of standard captures used in queries for Nvim,
highlighted according to the current colorscheme (use |:Inspect| on one to see
the exact definition):

@variable                       various variable names
@variable.builtin               built-in variable names (e.g. `this`, `self`)
@variable.parameter             parameters of a function
@variable.parameter.builtin     special parameters (e.g. `_`, `it`)
@variable.member                object and struct fields

@constant               constant identifiers
@constant.builtin       built-in constant values
@constant.macro         constants defined by the preprocessor

@module                 modules or namespaces
@module.builtin         built-in modules or namespaces
@label                  `GOTO` and other labels (e.g. `label:` in C), including heredoc labels

@string                 string literals
@string.documentation   string documenting code (e.g. Python docstrings)
@string.regexp          regular expressions
@string.escape          escape sequences
@string.special         other special strings (e.g. dates)
@string.special.symbol  symbols or atoms
@string.special.path    filenames
@string.special.url     URIs (e.g. hyperlinks)

@character              character literals
@character.special      special characters (e.g. wildcards)

@boolean                boolean literals
@number                 numeric literals
@number.float           floating-point number literals

@type                   type or class definitions and annotations
@type.builtin           built-in types
@type.definition        identifiers in type definitions (e.g. `typedef <type> <identifier>` in C)

@attribute              attribute annotations (e.g. Python decorators, Rust lifetimes)
@attribute.builtin      builtin annotations (e.g. `@property` in Python)
@property               the key in key/value pairs

@function               function definitions
@function.builtin       built-in functions
@function.call          function calls
@function.macro         preprocessor macros

@function.method        method definitions
@function.method.call   method calls

@constructor            constructor calls and definitions
@operator               symbolic operators (e.g. `+`, `*`)

@keyword                keywords not fitting into specific categories
@keyword.coroutine      keywords related to coroutines (e.g. `go` in Go, `async/await` in Python)
@keyword.function       keywords that define a function (e.g. `func` in Go, `def` in Python)
@keyword.operator       operators that are English words (e.g. `and`, `or`)
@keyword.import         keywords for including or exporting modules (e.g. `import`, `from` in Python)
@keyword.type           keywords describing namespaces and composite types (e.g. `struct`, `enum`)
@keyword.modifier       keywords modifying other constructs (e.g. `const`, `static`, `public`)
@keyword.repeat         keywords related to loops (e.g. `for`, `while`)
@keyword.return         keywords like `return` and `yield`
@keyword.debug          keywords related to debugging
@keyword.exception      keywords related to exceptions (e.g. `throw`, `catch`)

@keyword.conditional         keywords related to conditionals (e.g. `if`, `else`)
@keyword.conditional.ternary ternary operator (e.g. `?`, `:`)

@keyword.directive           various preprocessor directives and shebangs
@keyword.directive.define    preprocessor definition directives

@punctuation.delimiter  delimiters (e.g. `;`, `.`, `,`)
@punctuation.bracket    brackets (e.g. `()`, `{}`, `[]`)
@punctuation.special    special symbols (e.g. `{}` in string interpolation)

@comment                line and block comments
@comment.documentation  comments documenting code

@comment.error          error-type comments (e.g. `ERROR`, `FIXME`, `DEPRECATED`)
@comment.warning        warning-type comments (e.g. `WARNING`, `FIX`, `HACK`)
@comment.todo           todo-type comments (e.g. `TODO`, `WIP`)
@comment.note           note-type comments (e.g. `NOTE`, `INFO`, `XXX`)

@markup.strong          bold text
@markup.italic          italic text
@markup.strikethrough   struck-through text
@markup.underline       underlined text (only for literal underline markup!)

@markup.heading         headings, titles (including markers)
@markup.heading.1       top-level heading
@markup.heading.2       section heading
@markup.heading.3       subsection heading
@markup.heading.4       and so on
@markup.heading.5       and so forth
@markup.heading.6       six levels ought to be enough for anybody

@markup.quote           block quotes
@markup.math            math environments (e.g. `$ ... $` in LaTeX)

@markup.link            text references, footnotes, citations, etc.
@markup.link.label      link, reference descriptions
@markup.link.url        URL-style links

@markup.raw             literal or verbatim text (e.g. inline code)
@markup.raw.block       literal or verbatim text as a stand-alone block

@markup.list            list markers
@markup.list.checked    checked todo-style list markers
@markup.list.unchecked  unchecked todo-style list markers

@diff.plus              added text (for diff files)
@diff.minus             deleted text (for diff files)
@diff.delta             changed text (for diff files)

@tag                    XML-style tag names (e.g. in XML, HTML, etc.)
@tag.builtin            builtin tag names (e.g. HTML5 tags)
@tag.attribute          XML-style tag attributes
@tag.delimiter          XML-style tag delimiters

LSP HIGHLIGHT                                                    *lsp-highlight*

Reference Highlights:

Highlight groups that are meant to be used by |vim.lsp.buf.document_highlight()|.

You can see more about the differences in types here:
https://microsoft.github.io/language-server-protocol/specification#textDocument_documentHighlight

                                                         *hl-LspReferenceText*
LspReferenceText          used for highlighting "text" references
                                                         *hl-LspReferenceRead*
LspReferenceRead          used for highlighting "read" references
                                                        *hl-LspReferenceWrite*
LspReferenceWrite         used for highlighting "write" references
                                                       *hl-LspReferenceTarget*
LspReferenceTarget        used for highlighting reference targets (e.g. in a
                          hover range)
                                                             *hl-LspInlayHint*
LspInlayHint              used for highlighting inlay hints


                                                      *lsp-highlight-codelens*

Highlight groups related to |lsp-codelens| functionality.

                                                              *hl-LspCodeLens*
LspCodeLens
    Used to color the virtual text of the codelens. See
    |nvim_buf_set_extmark()|.

LspCodeLensSeparator                                 *hl-LspCodeLensSeparator*
    Used to color the separator between two or more code lenses.

                                                     *lsp-highlight-signature*

Highlight groups related to |vim.lsp.handlers.signature_help()|.

                                              *hl-LspSignatureActiveParameter*
LspSignatureActiveParameter
    Used to highlight the active parameter in the signature help. See
    |vim.lsp.handlers.signature_help()|.

------------------------------------------------------------------------------
LSP SEMANTIC HIGHLIGHTS                               *lsp-semantic-highlight*

When available, the LSP client highlights code using |lsp-semantic_tokens|,
which are another way that LSP servers can provide information about source
code.  Note that this is in addition to treesitter syntax highlighting;
semantic highlighting does not replace syntax highlighting.

The server will typically provide one token per identifier in the source code.
The token will have a `type` such as "function" or "variable", and 0 or more
`modifier`s such as "readonly" or "deprecated." The standard types and
modifiers are described here:
https://microsoft.github.io/language-server-protocol/specification/#textDocument_semanticTokens
LSP servers may also use off-spec types and modifiers.

The LSP client adds one or more highlights for each token. The highlight
groups are derived from the token's type and modifiers:
  • `@lsp.type.<type>.<ft>` for the type
  • `@lsp.mod.<mod>.<ft>` for each modifier
  • `@lsp.typemod.<type>.<mod>.<ft>` for each modifier
Use |:Inspect| to view the highlights for a specific token. Use |:hi| or
|nvim_set_hl()| to change the appearance of semantic highlights: >vim

    hi @lsp.type.function guifg=Yellow        " function names are yellow
    hi @lsp.type.variable.lua guifg=Green     " variables in lua are green
    hi @lsp.mod.deprecated gui=strikethrough  " deprecated is crossed out
    hi @lsp.typemod.function.async guifg=Blue " async functions are blue
<
The value |vim.hl.priorities|`.semantic_tokens` is the priority of the
`@lsp.type.*` highlights. The `@lsp.mod.*` and `@lsp.typemod.*` highlights
have priorities one and two higher, respectively.

You can disable semantic highlights by clearing the highlight groups: >lua

    -- Hide semantic highlights for functions
    vim.api.nvim_set_hl(0, '@lsp.type.function', {})

    -- Hide all semantic highlights
    for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
      vim.api.nvim_set_hl(0, group, {})
    end
<
You probably want these inside a |ColorScheme| autocommand.

Use |LspTokenUpdate| and |vim.lsp.semantic_tokens.highlight_token()| for more
complex highlighting.

The following is a list of standard captures used in queries for Nvim,
highlighted according to the current colorscheme (use |:Inspect| on one to see
the exact definition):

@lsp.type.class          Identifiers that declare or reference a class type
@lsp.type.comment        Tokens that represent a comment
@lsp.type.decorator      Identifiers that declare or reference decorators and annotations
@lsp.type.enum           Identifiers that declare or reference an enumeration type
@lsp.type.enumMember     Identifiers that declare or reference an enumeration property, constant, or member
@lsp.type.event          Identifiers that declare an event property
@lsp.type.function       Identifiers that declare a function
@lsp.type.interface      Identifiers that declare or reference an interface type
@lsp.type.keyword        Tokens that represent a language keyword
@lsp.type.macro          Identifiers that declare a macro
@lsp.type.method         Identifiers that declare a member function or method
@lsp.type.modifier       Tokens that represent a modifier
@lsp.type.namespace      Identifiers that declare or reference a namespace, module, or package
@lsp.type.number         Tokens that represent a number literal
@lsp.type.operator       Tokens that represent an operator
@lsp.type.parameter      Identifiers that declare or reference a function or method parameters
@lsp.type.property       Identifiers that declare or reference a member property, member field, or member variable
@lsp.type.regexp         Tokens that represent a regular expression literal
@lsp.type.string         Tokens that represent a string literal
@lsp.type.struct         Identifiers that declare or reference a struct type
@lsp.type.type           Identifiers that declare or reference a type that is not covered above
@lsp.type.typeParameter  Identifiers that declare or reference a type parameter
@lsp.type.variable       Identifiers that declare or reference a local or global variable

@lsp.mod.abstract        Types and member functions that are abstract
@lsp.mod.async           Functions that are marked async
@lsp.mod.declaration     Declarations of symbols
@lsp.mod.defaultLibrary  Symbols that are part of the standard library
@lsp.mod.definition      Definitions of symbols, for example, in header files
@lsp.mod.deprecated      Symbols that should no longer be used
@lsp.mod.documentation   Occurrences of symbols in documentation
@lsp.mod.modification    Variable references where the variable is assigned to
@lsp.mod.readonly        Readonly variables and member fields (constants)
@lsp.mod.static          Class members (static members)

HIGHLIGHTS                                              *diagnostic-highlights*

All highlights defined for diagnostics begin with `Diagnostic` followed by
the type of highlight (e.g., `Sign`, `Underline`, etc.) and the severity (e.g.
`Error`, `Warn`, etc.)

By default, highlights for signs, floating windows, and virtual text are linked to the
corresponding default highlight. Underline highlights are not linked and use their
own default highlight groups.

For example, the default highlighting for |hl-DiagnosticSignError| is linked
to |hl-DiagnosticError|. To change the default (and therefore the linked
highlights), use the |:highlight| command: >vim

    highlight DiagnosticError guifg="BrightRed"
<
                                                        *hl-DiagnosticError*
DiagnosticError
    Used as the base highlight group.
    Other Diagnostic highlights link to this by default (except Underline)

                                                        *hl-DiagnosticWarn*
DiagnosticWarn
    Used as the base highlight group.
    Other Diagnostic highlights link to this by default (except Underline)

                                                        *hl-DiagnosticInfo*
DiagnosticInfo
    Used as the base highlight group.
    Other Diagnostic highlights link to this by default (except Underline)

                                                        *hl-DiagnosticHint*
DiagnosticHint
    Used as the base highlight group.
    Other Diagnostic highlights link to this by default (except Underline)

                                                        *hl-DiagnosticOk*
DiagnosticOk
    Used as the base highlight group.
    Other Diagnostic highlights link to this by default (except Underline)

                                        *hl-DiagnosticVirtualTextError*
DiagnosticVirtualTextError
    Used for "Error" diagnostic virtual text.

                                        *hl-DiagnosticVirtualTextWarn*
DiagnosticVirtualTextWarn
    Used for "Warn" diagnostic virtual text.

                                                *hl-DiagnosticVirtualTextInfo*
DiagnosticVirtualTextInfo
    Used for "Info" diagnostic virtual text.

                                                *hl-DiagnosticVirtualTextHint*
DiagnosticVirtualTextHint
    Used for "Hint" diagnostic virtual text.

                                                *hl-DiagnosticVirtualTextOk*
DiagnosticVirtualTextOk
    Used for "Ok" diagnostic virtual text.

                                            *hl-DiagnosticVirtualLinesError*
DiagnosticVirtualLinesError
    Used for "Error" diagnostic virtual lines.

                                            *hl-DiagnosticVirtualLinesWarn*
DiagnosticVirtualLinesWarn
    Used for "Warn" diagnostic virtual lines.

                                            *hl-DiagnosticVirtualLinesInfo*
DiagnosticVirtualLinesInfo
    Used for "Info" diagnostic virtual lines.

                                            *hl-DiagnosticVirtualLinesHint*
DiagnosticVirtualLinesHint
    Used for "Hint" diagnostic virtual lines.

                                                *hl-DiagnosticVirtualLinesOk*
DiagnosticVirtualLinesOk
    Used for "Ok" diagnostic virtual lines.

                                                *hl-DiagnosticUnderlineError*
DiagnosticUnderlineError
    Used to underline "Error" diagnostics.

                                                *hl-DiagnosticUnderlineWarn*
DiagnosticUnderlineWarn
    Used to underline "Warn" diagnostics.

                                                *hl-DiagnosticUnderlineInfo*
DiagnosticUnderlineInfo
    Used to underline "Info" diagnostics.

                                                *hl-DiagnosticUnderlineHint*
DiagnosticUnderlineHint
    Used to underline "Hint" diagnostics.

                                                *hl-DiagnosticUnderlineOk*
DiagnosticUnderlineOk
    Used to underline "Ok" diagnostics.

                                                *hl-DiagnosticFloatingError*
DiagnosticFloatingError
    Used to color "Error" diagnostic messages in diagnostics float.
    See |vim.diagnostic.open_float()|

                                                *hl-DiagnosticFloatingWarn*
DiagnosticFloatingWarn
    Used to color "Warn" diagnostic messages in diagnostics float.

                                                *hl-DiagnosticFloatingInfo*
DiagnosticFloatingInfo
    Used to color "Info" diagnostic messages in diagnostics float.

                                                *hl-DiagnosticFloatingHint*
DiagnosticFloatingHint
    Used to color "Hint" diagnostic messages in diagnostics float.

                                                *hl-DiagnosticFloatingOk*
DiagnosticFloatingOk
    Used to color "Ok" diagnostic messages in diagnostics float.

                                                *hl-DiagnosticSignError*
DiagnosticSignError
    Used for "Error" signs in sign column.

                                                *hl-DiagnosticSignWarn*
DiagnosticSignWarn
    Used for "Warn" signs in sign column.

                                                *hl-DiagnosticSignInfo*
DiagnosticSignInfo
    Used for "Info" signs in sign column.

                                                *hl-DiagnosticSignHint*
DiagnosticSignHint
    Used for "Hint" signs in sign column.

                                                *hl-DiagnosticSignOk*
DiagnosticSignOk
    Used for "Ok" signs in sign column.

                                                *hl-DiagnosticDeprecated*
DiagnosticDeprecated
    Used for deprecated or obsolete code. Applied by the "underline" handler;
    disabled when `vim.diagnostic.config({ underline = false })`.

                                                *hl-DiagnosticUnnecessary*
DiagnosticUnnecessary
    Used for unnecessary or unused code. Applied by the "underline" handler;
    disabled when `vim.diagnostic.config({ underline = false })`.

					*highlight-groups* *highlight-default*
These are the builtin highlighting groups.  Note that the highlighting depends
on the value of 'background'.  You can see the current settings with the
":highlight" command.
							*hl-ColorColumn*
ColorColumn	Used for the columns set with 'colorcolumn'.
							*hl-Conceal*
Conceal		Placeholder characters substituted for concealed
		text (see 'conceallevel').
							*hl-CurSearch*
CurSearch	Current match for the last search pattern (see 'hlsearch').
		Note: This is correct after a search, but may get outdated if
		changes are made or the screen is redrawn.
						*hl-Cursor* *hl-lCursor*
Cursor		Character under the cursor.
lCursor		Character under the cursor when |language-mapping|
		is used (see 'guicursor').
							*hl-CursorIM*
CursorIM	Like Cursor, but used when in IME mode. *CursorIM*
							*hl-CursorColumn*
CursorColumn	Screen-column at the cursor, when 'cursorcolumn' is set.
							*hl-CursorLine*
CursorLine	Screen-line at the cursor, when 'cursorline' is set.
		Low-priority if foreground (ctermfg OR guifg) is not set.
							*hl-Directory*
Directory	Directory names (and other special names in listings).
							*hl-DiffAdd*
DiffAdd		Diff mode: Added line. |diff.txt|
							*hl-DiffChange*
DiffChange	Diff mode: Changed line. |diff.txt|
							*hl-DiffDelete*
DiffDelete	Diff mode: Deleted line. |diff.txt|
							*hl-DiffText*
DiffText	Diff mode: Changed text within a changed line. |diff.txt|
							*hl-DiffTextAdd*
DiffTextAdd	Diff mode: Added text within a changed line.  Linked to
		|hl-DiffText| by default. |diff.txt|
							*hl-EndOfBuffer*
EndOfBuffer	Filler lines (~) after the last line in the buffer.
		By default, this is highlighted like |hl-NonText|.
							*hl-TermCursor*
TermCursor	Cursor in a focused terminal.
							*hl-OkMsg*
OkMsg		Success messages.
							*hl-WarningMsg*
WarningMsg	Warning messages.
							*hl-ErrorMsg*
ErrorMsg	Error messages.
							*hl-StderrMsg*
StderrMsg	Messages in stderr from shell commands.
							*hl-StdoutMsg*
StdoutMsg	Messages in stdout from shell commands.
							*hl-WinSeparator*
WinSeparator	Separators between window splits.
							*hl-Folded*
Folded		Line used for closed folds.
							*hl-FoldColumn*
FoldColumn	'foldcolumn'
							*hl-SignColumn*
SignColumn	Column where |signs| are displayed.
							*hl-IncSearch*
IncSearch	'incsearch' highlighting; also used for the text replaced with
		":s///c".
							*hl-Substitute*
Substitute	|:substitute| replacement text highlighting.
							*hl-LineNr*
LineNr		Line number for ":number" and ":#" commands, and when 'number'
		or 'relativenumber' option is set.
							*hl-LineNrAbove*
LineNrAbove	Line number for when the 'relativenumber'
		option is set, above the cursor line.
							*hl-LineNrBelow*
LineNrBelow	Line number for when the 'relativenumber'
		option is set, below the cursor line.
							*hl-CursorLineNr*
CursorLineNr	Like LineNr when 'cursorline' is set and 'cursorlineopt'
		contains "number" or is "both", for the cursor line.
							*hl-CursorLineFold*
CursorLineFold	Like FoldColumn when 'cursorline' is set for the cursor line.
							*hl-CursorLineSign*
CursorLineSign	Like SignColumn when 'cursorline' is set for the cursor line.
							*hl-MatchParen*
MatchParen	Character under the cursor or just before it, if it
		is a paired bracket, and its match. |pi_paren.txt|
							*hl-ModeMsg*
ModeMsg		'showmode' message (e.g., "-- INSERT --").
							*hl-MsgArea*
MsgArea		Area for messages and command-line, see also 'cmdheight'.
							*hl-MsgSeparator*
MsgSeparator	Separator for scrolled messages |msgsep|.
							*hl-MoreMsg*
MoreMsg		|more-prompt|
							*hl-NonText*
NonText		'@' at the end of the window, characters from 'showbreak'
		and other characters that do not really exist in the text
		(e.g., ">" displayed when a double-wide character doesn't
		fit at the end of the line). See also |hl-EndOfBuffer|.
							*hl-Normal*
Normal		Normal text.
							*hl-NormalFloat*
NormalFloat	Normal text in floating windows.
							*hl-FloatBorder*
FloatBorder	Border of floating windows.
							*hl-FloatShadow*
FloatShadow	Blended areas when border is "shadow".
							*hl-FLoatShadowThrough*
FloatShadowThrough
		Shadow corners when border is "shadow".
							*hl-FloatTitle*
FloatTitle	Title of floating windows.
							*hl-FloatFooter*
FloatFooter	Footer of floating windows.
							*hl-NormalNC*
NormalNC	Normal text in non-current windows.
							*hl-Pmenu*
Pmenu		Popup menu: Normal item.
							*hl-PmenuSel*
PmenuSel	Popup menu: Selected item. Combined with |hl-Pmenu|.
							*hl-PmenuKind*
PmenuKind	Popup menu: Normal item "kind".
							*hl-PmenuKindSel*
PmenuKindSel	Popup menu: Selected item "kind".
							*hl-PmenuExtra*
PmenuExtra	Popup menu: Normal item "extra text".
							*hl-PmenuExtraSel*
PmenuExtraSel	Popup menu: Selected item "extra text".
							*hl-PmenuSbar*
PmenuSbar	Popup menu: Scrollbar.
							*hl-PmenuThumb*
PmenuThumb	Popup menu: Thumb of the scrollbar.
							*hl-PmenuMatch*
PmenuMatch	Popup menu: Matched text in normal item.  Combined with
		|hl-Pmenu|.
							*hl-PmenuMatchSel*
PmenuMatchSel	Popup menu: Matched text in selected item.  Combined with
		|hl-PmenuMatch| and |hl-PmenuSel|.
							*hl-PmenuBorder*
PmenuBorder	Popup menu: border of popup menu.
							*hl-PmenuShadow*
PmenuShadow	Popup menu: blended areas when 'pumborder' is "shadow".
							*hl-PmenuShadowThrough*
PmenuShadowThrough
		Popup menu: shadow corners when 'pumborder' is "shadow".
							*hl-ComplMatchIns*
ComplMatchIns	Matched text of the currently inserted completion.
							*hl-PreInsert*
PreInsert	Text inserted when "preinsert" is in 'completeopt'.
							*hl-ComplHint*
ComplHint	Virtual text of the currently selected completion.
							*hl-ComplHintMore*
ComplHintMore	The additional information of the virtual text.
							*hl-Question*
Question	|hit-enter| prompt and yes/no questions.
							*hl-QuickFixLine*
QuickFixLine	Current |quickfix| item in the quickfix window. Combined with
		|hl-CursorLine| when the cursor is there.
							*hl-Search*
Search		Last search pattern highlighting (see 'hlsearch').
		Also used for similar items that need to stand out.
							*hl-SnippetTabstop*
SnippetTabstop	Tabstops in snippets. |vim.snippet|
							*hl-SnippetTabstopActive*
SnippetTabstopActive
		The currently active tabstop. |vim.snippet|
							*hl-SpecialKey*
SpecialKey	Unprintable characters: Text displayed differently from what
		it really is. But not 'listchars' whitespace. |hl-Whitespace|
							*hl-SpellBad*
SpellBad	Word that is not recognized by the spellchecker. |spell|
		Combined with the highlighting used otherwise.
							*hl-SpellCap*
SpellCap	Word that should start with a capital. |spell|
		Combined with the highlighting used otherwise.
							*hl-SpellLocal*
SpellLocal	Word that is recognized by the spellchecker as one that is
		used in another region. |spell|
		Combined with the highlighting used otherwise.
							*hl-SpellRare*
SpellRare	Word that is recognized by the spellchecker as one that is
		hardly ever used. |spell|
		Combined with the highlighting used otherwise.
							*hl-StatusLine*
StatusLine	Status line of current window.
							*hl-StatusLineNC*
StatusLineNC	Status lines of not-current windows.
							*hl-StatusLineTerm*
StatusLineTerm	Status line of |terminal| window.
							*hl-StatusLineTermNC*
StatusLineTermNC
		Status line of non-current |terminal| windows.
							*hl-TabLine*
TabLine		Tabpages line, not active tabpage label.
							*hl-TabLineFill*
TabLineFill	Tabpages line, where there are no labels.
							*hl-TabLineSel*
TabLineSel	Tabpages line, active tabpage label.
							*hl-Title*
Title		Titles for output from ":set all", ":autocmd" etc.
							*hl-Visual*
Visual		Visual mode selection.
							*hl-VisualNOS*
VisualNOS	Visual mode selection when vim is "Not Owning the Selection".
							*hl-Whitespace*
Whitespace	"nbsp", "space", "tab", "multispace", "lead" and "trail"
		in 'listchars'.
							*hl-WildMenu*
WildMenu	Current match in 'wildmenu' completion.
							*hl-WinBar*
WinBar		Window bar of current window.
							*hl-WinBarNC*
WinBarNC	Window bar of not-current windows.
```
