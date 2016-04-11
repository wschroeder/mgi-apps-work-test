# MGI Apps Team Work Sample Test

This project consists of a small set of challenges distilled from actual tasks
that have been performed by members of our team, complete with a
[Docker](https://www.docker.com/) environment supplied with minimal tools to
help you solve the challenges.


## General Rules

Recommended way to start the docker environment:

```bash
docker run -v /:/myroot --rm -it wschroeder/mgi-apps-work-test bash
```


You may extend the environment as you see fit.  The Docker image is stocked
with the vim, emacs, and nano editors.

You may also solve the challenges in whatever programming languages you
choose; we highly appreciate diverse backgrounds and will need that kind of
experience for our new projects.  However, keep in mind that the languages
mentioned in the challenges constitute the majority of our legacy codebase.  I
usually ease new people in with a few bugfixes and feature additions so that
they may be brought up to speed quickly on our workflow, designs, and cruft.

If running Docker is problematic, the challenges are also available in this
git repository under the `challenges` directory.  The `Dockerfile` at the root
of this repository should clearly specify the basic requirements for running
the challenges.


## Challenges

* [Challenge 1: Transform Data](challenges/challenge1/README.md) --
  Use Perl or JavaScript to transform data from a list of objects with
  attributes into a specific hashmap arrangement.
* [Challenge 2: Parse TSV](challenges/challenge2/README.md) --
  Use Bash to write a short, quick-and-dirty one-liner that transforms TSV data.
* [Challenge 3: Update a Tree](challenges/challenge3/README.md) --
  Use Perl or JavaScript to update a specific set of values within a tree of objects.
* [Challenge 4: Maintain Legacy Code](challenges/challenge4/README.md) --
  Update an external application.
* [Challenge 5: Design a Schema](challenges/challenge5/README.md) --
  Design a schema for tracking teams, players, and games.

