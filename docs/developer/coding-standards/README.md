# Fieldsets Coding Standards

Coding standards are collections of coding rules, guidelines, and best practices. Standards are not hard rules that need to be followed all the time. There are always exceptions, but the main focus for the standards at Fieldsets is to establish readablity and familiarity of a code base that will be interacted with by numerous teams.

While Fieldsets has a large number of legacy code bases that do not apply these coding standards, the goal is moving forward to have all new code written following these standards. While not expected, you may find as you work with older codebases that some code would benefit from the improved readablilty of standardized code. Feel free to clean up any legacy code as you see fit.

Overall there are a few rules that apply to developing a readable code base:

- No commented code. If it is not used remove it before it is pushed to production.
- No extra white space. Use section comment headers to create visual breakpoints.
- Any comments left in code, should be descriptive about the approach in the following code or why it was written this way.
- Use a linter to help keep your code clean.
- Use functions/classes whenever possible for code reuse and readabliity.
- Document all functions and classes with comment headers.
- Before merging code to production, ask for a code review.
