# Shell coding standards
Where applicable we follow [Google's Shell Style Guide](https://google.github.io/styleguide/shellguide.html) where standards are not defined below. Make sure you have installed a linter in your editor of choice to help keep your code consistent. We recommend [shellcheck](https://www.shellcheck.net/) as a linter that is widely supported in most editors. You can install shellcheck with a simple `brew install shellcheck` command on MacOS, and then install the linter extension into your editor.

## Fieldsets Specific Coding Standards

- Differences
  - **Indentation** - Use 4 spaces instead of 2, just like common programming languages.
  - **Shebang** - `#!/usr/bin/env bash`, not `#!/usr/bin/bash`

## Table of Content

- Shell Files
  - [File Extension](#file-extension)
  - [Shebang](#shebang)
  - [Include Files](#include-files)
- Naming Convention
  - [Varible](#variable)
  - [Function](#function)
  - [Source Filename](#source-filename)
- Formating
  - [Indentation](#indentation)
  - [Lines](#lines)
  - [Variables](#variables)
  - [Arrays](#arrays)
  - [Heredoc](#heredoc)
  - [Quoting](#quoting)
- Control Structures
  - [If Statement](#if-statement)
  - [For Statement](#for-statement)
  - [While Statement](#while-statement)
  - [Case Statement](#case-statement)
- Comments
  - [File Headers](#file-headers)
  - [Function Headers](#function-headers)
  - [Section Headers](#section-headers)
  - [Todo Comments](#todo-comments)

## Shell Files

### File Extension

- [x] Executables should have a .sh extension.
- [x] Libraries (included files) should have a .sh extension.

```
00-init.sh
```

### Shebang

- [x] Shebang lines must always be `#!/usr/bin/env bash`<br />
 `#!/usr/bin/env` searches `PATH` for `bash`.
This allows you to change your `PATH` to get the interpreter without having to edit every file you're working on.

```
#!/usr/bin/env bash
```

### Include Files

- [x] 1. The included files should not have shebang lines.
- [x] 2. Use `source` instead of  `.` to include files. Although `.` is POSIX standard, the `source` word provides more readability.

Yes

```
source "${CODE_PATH}/inc/functions.sh"
```

No

```
# Use source keyword provides more readability.
. "${CODE_PATH}/inc/functions.sh"
```

## Naming Convention

### Variable

- [x] 1. Always use underscore naming convention.
- [x] 2. No camel-case naming convention.
- [x] 3. If a variable can be changed from its parent environment, it should be in uppercase.
- [x] 4. If a variable can be changed from a command line argument, it could be in uppercase, and name it starting with an underscore.
- [x] 5. Other varibles should be lowercase.

Yes

```
fieldsets_variable="1"
```

No

```
# No camel-case naming convention.
fieldsetsVariable="1"
```

### Function

- [x] 1. Always use underscore naming convention.
- [x] 2. No camel-case naming convention.
- [x] 3. A function name should be lowercase.
- [x] 4. Braces must be on the same line as the function name.

Yes
```
func_test() {
   local this_is_local="Local variable"
   echo ${this_is_local}
}

func_test
```

No
```
# Braces must be on the same line as the function name.

func_test() 
{
   local this_is_local="Local variable"
   echo ${this_is_local}
}

func_test
```

### Source Filename

- [x] Lowercase, with hyphens to separate words if needed.

## Formating

### Indentation

- [x] 1. Indent 4 spaces for each level of indentation.
- [x] 2. No Tabs
- [x] 3. Vertical indentation in *array* is 4 spaces and up to five values per line. ([example](#arrays))

```
if [ "${abc}" == "yes" ]; then
    echo "ok"
fi
```

### Lines

- [x] 1. No unnecessary semicolons `;`.
- [x] 2. No trailing spaces in the end of line.
- [x] 3. No spaces in empty line.

### Variables

- [x] 1. Using the local keyword inside functions prevents problems with global variables.
- [x] 2. Always quote the value, unless the value is Integer.
- [x] 3. Always brace-quote the variables when using them, except single character shell specials. (ex. `?`, `*`, `#`, etc..)

Yes
```
version="1.0"
```

No `3`
```
# Missing quotes.
version=1.0
```

Yes
```
func_test() {
   local this_is_local="Local variable"
   echo ${this_is_local}
}

func_test
```

No
```
# Missing local keyword when defining a varible in a function.

func_test() {
   this_is_local="Local variable"
   echo ${this_is_local}
}

func_test
```

### Arrays

- [x] 1. Values on a single line. Single space between values. No space next to parenthesis.
- [x] 2. Always quotes the values in the array, unless index.

Yes
```
modules=("bcmath" "bz2" "cgi" "cli" "common" "zip")
```

Yes
```
array=("one" "two" "three" "four" [6]="five")
```

No
```
modules=( bcmath bz2 cgi cli common zip )
```

### Heredoc

- [x] 1. Delimiting identifier should always be uppercase.
- [x] 2. No semicolon `;` after delimiting identifier.
- [x] 3. Redirect and the delimiting identifier should be separated by a space.

YES
```
cat << EOF
This is an example.
easybash
EOF
```

No
```
# Delimiting identifier should be uppercase.
cat << eof
This is an example.
easybash
eof
```
No
```
# Semicolon is unnecessary.
cat << EOF;
This is an example.
easybash
EOF
```

No
```
# Missing a sapce between redirect and the delimiting identifier.
cat <<EOF
This is an example.
easybash
EOF
```

### Quoting

- [x] Always quote strings containing variables, command substitutions, spaces or shell meta characters, unless careful unquoted expansion is required.
- [x] Double quotes is strongly preferred.

## Control Structures

### If Statement

- [x] `;` and `then` should be on the same line, separated by a space.
- [x] `else`、`elif`、`fi` should be on its own line vertically aligned with the `if` statement.

```
status="error"

# if..fi statement
if [ "${status}" == "success" ]; then
    echo "success"
else
    echo "other"
fi

# if..elif..fi statement
if [ "${status}" == "success" ]; then
    echo "success"
elif [ "${status}" == "error" ]; then
    echo "error"
else
    echo "other"
fi
```

### For Statement

- [x] `;` and `do` should be on the same line, separated by a space.
- [x] `done` should be on its own line vertically aligned with the `for` statement
```
for module in ${modules[@]}; do
    func_msg info "Proceeding to install module \"${module}\" ..."
    sudo ${_PM} install -y app${package_version}-${module}
done
```

### While Statement

- [x] `;` and `do` should be on the same line, separated by a space.
- [x] `done` should be on its own line vertically aligned with the `while` statement.

```
i=0

while [ ${i} -lt 5 ]; do
    i=$(($i+1))
    echo ${i}
done
```

### Case Statement

- [x] Indent 4 spaces.
- [x] The patterns `"action")` and the corresponding action terminator `;;` are indented at the same level.
- [x] The pattern strings should be around with double quotes to keep readability.
- [x] Do not quote pattern-matching metacharacters. (`*`, `?`, `|`, etc...)

```
while [ "$#" -gt 0 ]; do
    case "$1" in
        "-v") 
            package_version="${2}"
            shift 2
        ;;
        "--version="*) 
            package_version="${1#*=}"; 
            shift 1
        ;;
        # Help
        "-h"|"--help")
            show_script_help
            exit 1
        ;;
        # Info
        "-i"|"--information")
            show_script_information
            exit 1
        ;;
        "-"*)
            echo "Unknown option: ${1}"
            exit 1
        ;;
        *)
            echo "Unknown option: ${1}"
            exit 1
        ;;
    esac
done
```

## Comments

### File Header

- [x] Include descriptive file header summarizing purpose of script and any relative information.
- [x] Prefix any parameters, dependencies, includes or environment variables in header with an `@`
- [x] Utilize `#===` to open and close header comment.

Yes
```
#===
# 00-init.sh: Description of 00-init.sh
# Other useful infomation
#
# @envvar VERSION | String 
# @envvar ENVIRONMENT | String
# @param arg1 | String
# @dependency ./data.csv | File
# @include ./lib/functions.sh | File
#
#===
```

### Function Headers
- [x] Include descriptive function header summarizing purpose of script and any relative information.
- [x] Prefix any parameters, dependencies, includes or environment variables in header with an `@`
- [x] Utilize `##` to open and close function header.

```
##
# wait_for_threads: Look at pids array and wait for all pids to complete.
# @depends pids
##
wait_for_threads() {
    # Our threads are running in the background. Lets wait for all of them to complete.
    for p in "${pids[@]}";
    do
        echo "Waiting for process id ${p}......"
        wait "${p}" 2>/dev/null
        echo "Thread with PID ${p} has completed"
    done

    pids=();
}
```

### Section Headers
- [x] Use a comment as a section header with the defined section as either `Variables`, `Functions` or `Main`.
- [x] Utilize `#===` to open and close section header.

```
#===
# Variables
#===

pids=()

#===
# Functions
#===

##
# traperr: Better error handling
##
traperr() {
  echo "ERROR: ${BASH_SOURCE[1]} at about ${BASH_LINENO[0]}"
}

##
# wait_for_threads: Look at pids array and wait for all pids to complete.
# @depends pids
##
wait_for_threads() {
    # Our threads are running in the background. Lets wait for all of them to complete.
    for p in "${pids[@]}";
    do
        echo "Waiting for process id ${p}......"
        wait "${p}" 2>/dev/null
        echo "Thread with PID ${p} has completed"
    done

    pids=();
}

##
# init_server: setup container config
##
init_server() {
    echo "Initializing server....";
}

#===
# Main
#===
trap traperr ERR
init_server
```
