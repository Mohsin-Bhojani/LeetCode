# LeetCode repo: instructions for Claude

My LeetCode solutions. I solve problems on leetcode.com, mostly in Swift, and
save them here with `./new.sh`, then commit and push with `./push.sh`.

## When I share a screenshot of a problem

Teach me the concepts I need. Don't solve it for me.

1. Read the number, title, difficulty and constraints from the screenshot.
2. If the problem folder doesn't exist yet, create it:
   `./new.sh <number> "<title>" <easy|medium|hard>`
3. Write a `## Concepts to learn` section in that problem's `README.md`
   (replace it if it's already there). Include:
   - **What the constraints tell you.** Turn the input size into a target time
     complexity, e.g. n ≤ 10⁴ means O(n²) is borderline and O(n) or O(n log n) is safe.
     Point out edge cases the constraints allow (negatives, duplicates, empty input).
   - **1–3 concepts or data structures** to study. For each: what it is, why it
     fits this problem, and a tiny generic Swift example that does **not** solve
     the problem.
   - **Hints that build on each other**, each in its own `<details>` block so I
     can open them one at a time. The last hint can describe the idea but
     never includes code.
   - **Similar problems** that use the same concepts, with LeetCode links.
4. In chat, give me a short version of the same concepts and point me to the README.
5. Don't write code in `Solution.*` and don't fill in **Pattern**. I do those myself.
   Show a solution only if I ask for one.

If the screenshot shows my code or that the problem is already solved, also
review my code: is it correct, what is its complexity, and is there a better
approach (as a concept to learn, not code).

## Repo conventions

- Layout: `Easy|Medium|Hard/NNNN-slug/` with `Solution.<ext>` and `README.md`.
- Commits go straight to `main` through `./push.sh`. Don't commit or push unless I ask.
