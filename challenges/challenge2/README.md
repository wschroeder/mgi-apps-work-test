# Challenge 2: Parse TSV

Use Bash to write a short, quick-and-dirty one-liner that transforms TSV data.


## The Problem

We are going to transform some simple TSV data.  By simple, I mean that there
are no trick values that have tabs in them and that each line in the TSV data
is equivalent to a single row of data.  Here is the arrangement of sample TSV
data after some query:

```
Project    ID  Step       Date                 Status     Sample
Project 1  12  some step  2015-03-12 14:14:14  scheduled  Sample 8
Project 2  13  some step  2015-04-12 14:14:14  completed  Sample 4
Project 1  14  some step  2015-02-12 14:14:14  failed     Sample 2
Project 2  15  some step  2015-03-15 14:14:14  completed  Sample 7
Project 3  16  some step  2015-03-10 14:14:14  completed  Sample 9
Project 4  17  some step  2015-11-12 14:14:14  completed  Sample 9
Project 1  18  some step  2015-03-03 14:14:14  failed     Sample 8
Project 1  19  some step  2015-09-03 14:14:15  completed  Sample 8
Project 1  11  some step  2015-07-17 14:14:14  completed  Sample 1
```


Using a bash commandline and your knowledge of output piping, pretend you are
short on time, and write a short, quick-and-dirty one-liner that transforms
this data into output of the following form: I want the Project, Date, and
Sample columns (that exact order) for all things whose Status is "completed"
and whose Date is anywhere in the month of March 2015.  Example output for the
above input:

```
Project 2  2015-03-15 14:14:14  Sample 7
Project 3  2015-03-10 14:14:14  Sample 9
```


## Testing with Docker

Two files of sample data are available in `/challenges/challenge2`:
`sample1.tsv` and `sample2.tsv`.  You can test your one-liner by piping it to
`/challenges/challenge2/test.sh`.

```bash
$ docker run --rm -it wschroeder/mgi-apps-work-test bash
root@uuid:/challenges# cd challenge2

# Test failure
root@uuid:/challenges/challenge2# cat sample1.tsv | youranswer | ./test.sh
FAIL
root@uuid:/challenges/challenge2# cat sample2.tsv | youranswer | ./test.sh
FAIL

# Test success
root@uuid:/challenges/challenge2# cat sample1.tsv | youranswer | ./test.sh
PASS
root@uuid:/challenges/challenge2# cat sample2.tsv | youranswer | ./test.sh
PASS
```

## Submission

You may send me the one-liner.


## Notes

You may solve this challenge in whatever programming language you choose; we
highly appreciate diverse backgrounds and will need that kind of experience
for our new projects.  For this particular challenge, it would be interesting
to see an answer in an alternative language.  However, this challenge also
helps us to understand your present facility with the bash shell.

The Docker image is stocked with the vim, emacs, and nano editors.

