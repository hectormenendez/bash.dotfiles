# Use auto-indentation
set autoindent

# Use cut to end of line with ^K by default
set cut

# Don't convert files from DOS/Mac format
set noconvert

# Don't display the help lists at the bottom of the screen
# set nohelp

# Don't wrap text at all
set nowrap

# Use smooth scrolling as the default
set smooth

# Use this spelling checker instead of the internal one.  This option
# does not properly have a default value.
set speller "aspell -c"

# Allow nano to be suspended with ^Z
# set suspend

# Use this tab size instead of the default; it must be greater than 0
set tabsize 4

# Enable ~/.nano_history for saving and reading search/replace strings.
set historylog

#Color Syntax Highlighting
syntax "c-file" "\.(c|h)$"
color red "\<[A-Z_]{2,}\>"
color green "\<(float|char|int|void|static|const|struct)\>"
color brightyellow "\<(if|while|do|else|case|switch)\>"
color brightcyan "^#(  )*(define|include|ifn?def|endif|elif|else|if)"
color brightyellow "<[^=       ]*>" ""(.|[^"])*"
color brightyellow start=""(\\.|[^\"])*\\( |   )*$" end="^(\\.|[^\"])*""
color brightblue "//.*"
color brightblue start="/\*" end="\*/"

syntax "HTML" "\.html$"
color blue start="<" end=">"
color red "&[^;        ]*;"

syntax "TeX" "\.tex$"
color green "\\.|\\[A-Za-z]*"
color magenta "[{}]"
color blue "%.*"

syntax "mutt"
color green "^>.*"

syntax "php" ".*/*.php$"
color brightwhite "\{|\}|\."
color red "('[^']*')"
color red "\"[^\"]*\""
color brightblue "(\$([[:alpha:]_]|->)*)"
color brightgreen "((\$(([[:alpha:]_0-9])+\->)+)[[:alpha:]_0-9]+\()"
color yellow " (if|else if|else|return|case|break)"
color yellow "\|\||\?|!|\||&&|=|;|\(|\)"
color red "false|true"
color brightwhite "[[:space:]]+debug|[[:space:]]+echo|\$this\->debug"
color cyan "//.*"
color cyan start="/\*" end="\*/"

syntax "groff" "\.ms$" "\.mm$" "\.me$" "\.tmac$" "^tmac." ".rof"
color cyan "^\.ds [^ ]*"
color cyan "^\.nr [^ ]*"
color brightmagenta "\\."
color brightmagenta "\\f."
color brightmagenta "\\f\(.."
color brightmagenta "\\s(\+|\-)?[0-9]"
color cyan "(\\|\\\\)n."
color cyan "(\\|\\\\)n\(.."
color cyan start="(\\|\\\\)n\[" end="]"
color brightgreen "^\. *[^ ]*"
color yellow "^\.\\\".*$"
color green "(\\|\\\\)\*."
color green "(\\|\\\\)\*\(.."
color green start="(\\|\\\\)\*\[" end="]"
color brightred "\\\(.."
color brightred start="\\\[" end="]"
color brightcyan "\\\\\$[1-9]"

syntax "perl" "\.p[lm]$"
color red "\<(accept|alarm|atan2|bin(d|mode)|c(aller|h(dir|mod|op|own|root)|lose(dir)?|onnect|os|rypt)|d(bm(close|open)|efined|elete|ie|o|ump)|e(ach|of|val|x(ec|ists|it|p))|f(cntl|ileno|lock|ork)|get(c|login|peername|pgrp|ppid|priority|pwnam|(host|net|proto|serv)byname|pwuid|grgid|(host|net)byaddr|protobynumber|servbyport)|([gs]et|end)(pw|gr|host|net|proto|serv)ent|getsock(name|opt)|gmtime|goto|grep|hex|index|int|ioctl|join|keys|kill|last|length|link|listen|local(time)?|log|lstat|m|mkdir|msg(ctl|get|snd|rcv)|next|oct|open(dir)?|ord|pack|pipe|pop|printf?|push|q|qq|qx|rand|re(ad(dir|link)?|cv|do|name|quire|set|turn|verse|winddir)|rindex|rmdir|s|scalar|seek|seekdir|se(lect|mctl|mget|mop|nd|tpgrp|tpriority|tsockopt)|shift|shm(ctl|get|read|write)|shutdown|sin|sleep|socket(pair)?|sort|spli(ce|t)|sprintf|sqrt|srand|stat|study|substr|symlink|sys(call|read|tem|write)|tell(dir)?|time|tr|y|truncate|umask|un(def|link|pack|shift)|utime|values|vec|wait(pid)?|wantarray|warn|write)\>"
color magenta "\<(continue|else|elsif|do|for|foreach|if|unless|until|while|eq|ne|lt|gt|le|ge|cmp|x|my|sub|use|package|can|isa)\>"
color cyan start="[$@%]" end="( |\\W|-)"
color yellow "".*"|qq\|.*\|"
color white "[sm]/.*/"
color white start="(^use| = new)" end=";"
color green "#.*"
color yellow start="<< 'STOP'" end="STOP"

syntax "Java source" "\.java$"
color green "\<(boolean|byte|char|double|float|int|long|new|short|this|transient|void)\>"
color red "\<(break|case|catch|continue|default|do|else|finally|for|if|return|switch|throw|try|while)\>"
color cyan "\<(abstract|class|extends|final|implements|import|instanceof|interface|native|package|private|protected|public|static|strictfp|super|synchronized|throws|volatile)\>"
color red "[^\"]*"
color yellow "<(true|false|null)>"
color blue "//.*"
color blue start="/\*" end="\*/"
color brightblue start="/\*\*" end="\*/"
#color brightgreen,brightgreen "[       ]+$"

syntax "nanorc" "[\.]*nanorc$"
color white "^ *(set|unset).*$"
color cyan "^ *(set|unset) (autoindent|backup|const|cut|fill|keypad|multibuffer|noconvert|nofollow|nohelp|nowrap|operatingdir|preserve|quotestr|regexp|smooth|speller|suspend|tabsize|tempfile|historylog|view)"
color brightwhite "^ *syntax [^ ]*"
color brightblue "^ *set\>" "^ *unset\>" "^ *syntax\>"
color white "^ *color\>.*"
color yellow "^ *color (bright)?(white|black|red|blue|green|yellow|magenta|cyan)\>"
color magenta "^ *color\>"
color green "^#.*$"

## Here is an example for Bourne shell scripts.
##
syntax "bash" "\.sh$"
#header "^#!.*/(ba|k|pdk)?sh[-0-9_]*"
icolor brightgreen "^[0-9A-Z_]+\(\)"
color green "\<(case|do|done|elif|else|esac|exit|fi|for|function|if|in|local|read|return|select|shift|then|time|until|while)\>"
color green "(\{|\}|\(|\)|\;|\]|\[|\`|\\|\$|<|>|!|=|&|\|)"
color green "-[Ldefgruwx]\>"
color green "-(eq|ne|gt|lt|ge|le|s|n|z)\>"
color brightblue "\<(cat|cd|chmod|chown|cp|echo|env|export|grep|install|let|ln|make|mkdir|mv|rm|sed|set|tar|touch|umask|unset)\>"
color brightyellow "(\\.|[^\"])*"
icolor brightred "\$\{?[0-9A-Z_!@#$*?-]+\}?"
color brightyellow "'(\\.|[^'])*'"
color cyan "(^|[[:space:]])#.*$"
color ,green "[[:space:]]+$"
