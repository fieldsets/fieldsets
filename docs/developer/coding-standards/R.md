Where applicable we follow [Tidyverse's R Style Guide](https://style.tidyverse.org/) where standards are not defined below.

## Use explicit returns

Do not rely on R’s implicit return feature. It is better to be clear about your intent to return() an object.

```R
# Good
AddValues <- function(x, y) {
  return(x + y)
}

# Bad
AddValues <- function(x, y) {
  x + y
}
```

## Qualifying namespaces

Users should explicitly qualify namespaces for all external functions.

```R
# Good
purrr::map()
```

We discourage using the @import Roxygen tag to bring in all functions into a NAMESPACE. Google has a very big R codebase, and importing all functions creates too much risk for name collisions.

While there is a small performance penalty for using ::, it makes it easier to understand dependencies in your code. There are some exceptions to this rule.

Infix functions (%name%) always need to be imported.
Certain rlang pronouns, notably .data, need to be imported.
Functions from default R packages, including datasets, utils, grDevices, graphics, stats and methods. If needed, you can @import the full package.
When importing functions, place the @importFrom tag in the Roxygen header above the function where the external dependency is used.
