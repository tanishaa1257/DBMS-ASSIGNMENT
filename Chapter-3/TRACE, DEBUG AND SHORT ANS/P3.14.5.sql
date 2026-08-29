| Feature | Implicit Cursor | Explicit (Simple) Cursor | Parameterised Cursor |
|---------|-----------------|--------------------------|----------------------|
| Who declares it? | Oracle automatically | Programmer | Programmer |
| Who opens and closes it? | Oracle automatically | Programmer | Programmer |
| Reused with different values? | No direct reuse | No, fixed query | Yes, different parameter values |
| Best choice | INSERT, UPDATE, DELETE or single-row SELECT INTO | Processing rows from one fixed query | Same query needed for different inputs |

Examples:

Implicit Cursor:
Best for a simple INSERT, UPDATE, DELETE or SELECT INTO operation.

Explicit (Simple) Cursor:
Best when processing all books from a fixed query.

Parameterised Cursor:
Best when the same query needs to be executed for different
categories, prices, publishers, etc.
