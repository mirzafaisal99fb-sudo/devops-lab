# Lab 03 — Git in Depth: Branching, Rebasing and Finding Regressions

**Student:** Mirza Muhammad Faisal Baig  
**Registration Number:** 23-NTU-CS-1175  
**Course:** DevOps Principles and Practices  
**Environment:** Ubuntu 24.04 on WSL2

## 1. Git Object Inspection

The following Git objects were inspected using git cat-file and git rev-parse:

- Final commit tree at the time of inspection: `203036b8f4d4e8609bee7ae97152b9ede2bc8974`
- Source directory tree: `2dbaf21a3fd004474050eac016b1381cc38451e3`
- `src/services.txt` blob: `5f32579b39b9805a9705ffe6e39a04f0455b134a`

A tree object records the contents of a directory. A blob stores file contents. Git commits reference trees and parent commits to represent project snapshots and history.

## 2. Branching and Merge Conflict Resolution

The `feature/word-count` branch added a count target that reports the number of words in the built output. The `main` branch separately added a count target to count source files.

Because both branches modified the same Makefile target area, a merge conflict occurred. The conflict was resolved by retaining both useful operations in the final count target: counting source files and reporting the total number of built words.

The branches were merged, and the resulting project history was inspected using Git's graph output.

## 3. Rebasing and Commit Hashes

Before rebasing `feature/docs` onto `main`, its documentation commit was `e55864d`. After rebasing, the commit became `0f676e0`.

Rebasing recreates commits on a new parent commit. Since a commit hash depends on its content, metadata, and parent reference, the recreated commit can have a different hash even when its message and changes remain the same.

## 4. Git Tag

An annotated tag named `v1.0.0` was created for the completed build pipeline. The tag was verified using Git tag and describe commands.

## 5. Git Bisect and Regression Finding

The regression test compared the number of lines in `input.txt` and `output.txt`. The input contained four lines, but the faulty transformation produced only three lines.

The first bad commit identified by `git bisect run ./test-build.sh` was:

`2d389cb76ad43436966cfd3078939815c401214d`

Commit message: `Speed up the transform step`

The test returned a non-zero exit status when the output line count did not match the input. Git bisect used binary search to narrow down the faulty commit rather than testing every commit sequentially.

## 6. Build Verification

The main project was verified using `make ci`. The pipeline checked the source files, built the outputs, and ran the test successfully, displaying `TEST PASSED`.

The original Lab 02 project files were retained. The fallback project was not used.

## 7. Main Branch History

The Git history graph is included below. It records the branch merges, commits, and release tag used for this submission.

```text
*   c5771c9 (HEAD -> main, tag: v1.0.0) Merge feature/docs
|\  
| * 0f676e0 (feature/docs) Document the Makefile targets inline
|/  
* b8ba5a7 Add a README
*   920b031 Merge feature/word-count
|\  
| * d86cf04 (feature/word-count) Add a count target reporting built words
* | aefcaed Add a count target for source files
|/  
* 9d49311 Correct the contents of report.txt
* 3683932 Add report.txt to the build inputs
* 1aaff45 Add Lab 02 build pipeline
```
