# Contributing

This repository relates to activities in the Internet Engineering Task Force
([IETF](https://www.ietf.org/)). All material in this repository is considered
Contributions to the IETF Standards Process, as defined in the intellectual
property policies of IETF currently designated as
[BCP 78](https://www.rfc-editor.org/info/bcp78),
[BCP 79](https://www.rfc-editor.org/info/bcp79) and the
[IETF Trust Legal Provisions (TLP) Relating to IETF Documents](http://trustee.ietf.org/trust-legal-provisions.html).

Any edit, commit, pull request, issue, comment or other change made to this
repository constitutes Contributions to the IETF Standards Process
(https://www.ietf.org/).

You agree to comply with all applicable IETF policies and procedures, including,
BCP 78, 79, the TLP, and the TLP rules regarding code components (e.g. being
subject to a Simplified BSD License) in Contributions.


# Production Process

All updates to this document are made via pull requests (PRs)
submitted via the GitHub user interface.  Anyone may submit a
PR.  See below for more information about how PRs are reviewed
and merged/closed.

As this document is currently an individual draft (I-D), in
the IETF sense, it is not yet necessary to get consensus for
changes made here.

Ultimately, this document will be submitted to the NETMOD WG
for consideration for adoption.  At that time, WG consensus
will be held for all of the updates made up to that point.

However, until then, given the complexity of this effort,
all updates (PRs) are subject to a GitHub-enabled review
process.  Only the designated experts (i.e., the
`rfc7950bis-owners` team) and the PR-owner(s) participate
in the review process.

A PR will be automatically-merged as soon as all of the
following are true:
  - The PR is up-to-date with the current `main` branch.
  - All automated GitHub Workflow Actions pass (xml2rfc, idnits, etc.).
  - There are at least three "approvals".
  - There are no "request changes".
  - All "conversations" resolved

In order to facilitate the process, PRs SHOULD be as small as possible,
focusing on a single item.  It is unnecessary for a PR to be tracked by
the [YANG-Next Issue Tracker](https://github.com/netmod-wg/yang-next/issues),
though that is certainly an excellent place to find something to work on.

Please be aware that PRs MUST be "complete", in that they completely
update the document including, when needed, the following sections:
Summary of Changes from RFC 7950, IANA Considerations, Security
Considerations, Normative References, Informative References, etc.
A checklist for such things will be automatically added to PRs in
order to ensure these updates occur.

For complex issues, aspiring PR authors are encouraged to request
a "kickoff" discussion with the designated experts by creating a
"design" files (in the `/designs` directory) and submitting a PR
to add just that file to the repository.  Doing so triggers the
exact same merge-requirements listed above so, once the "design PR"
is merged, it is pretty safe to proceed with the settled-upon
approach.

Please note that, once this document is adopted as a NETMOD WG document,
the same PR-process discussed above will continue with one modification:
upon a PR being merged to `main` (FIXME: before or after being pushed
to Datatracker?), an email will be sent to the NETMOD WG list seeking
consensus (at least, no objections) from the list.  Note that this
is a necessary but largely perfunctorial gesture, as already the
update was approaved by the designated experts, leaving little room
for an objection to be raised.


# Build Artifacts

Each PR-update and PR-merge causes a GitHub Workflow to execute that generates and
publishes build artifacts (the draft compiled in its various formats) to be published
to the [Build Artifacts for rfc7950bis](https://netmod-wg.github.io/rfc7950bis/) page.


# Attribution

The "author list" is automatically calculated by sorting all of the GitHub-contributors
by "total" lines added, removed, and changed.
