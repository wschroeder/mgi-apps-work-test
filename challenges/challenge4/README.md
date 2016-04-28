# Challenge 4: Maintain Legacy Vendor Code

Update an external application.


## The Problem

Sometimes we run into problems with external vendor applications.  For
example, we use the Broad Institute's Picard tools for manipulation of common
file types.

In version 2.2.1 of Picard, there are inconsistent logging messages:

```
root@uuid:/challenges/challenge4/picard# java -jar dist/picard.jar ViewSam HEADER_ONLY=true I=http://www.ebi.ac.uk/arrayexpress/files/E-MTAB-3279/E-MTAB-3279.Col0_C1.snp.concordant_uniq.sorted.bam > /dev/null
# ...
[Mon Apr 11 17:15:53 UTC 2016] picard.sam.ViewSam done. Elapsed time: 0.05 minutes.
Runtime.totalMemory()=32440320
```


Please modify the appropriate source code to fix this inconsistency.  I expect:

```
root@uuid:/challenges/challenge4/picard# java -jar dist/picard.jar ViewSam HEADER_ONLY=true I=http://www.ebi.ac.uk/arrayexpress/files/E-MTAB-3279/E-MTAB-3279.Col0_C1.snp.concordant_uniq.sorted.bam > /dev/null
# ...
[Mon Apr 11 17:15:53 UTC 2016] picard.sam.ViewSam done. Elapsed time: 0.05 minutes.
[Mon Apr 11 17:15:53 UTC 2016] Runtime.totalMemory()=32440320
```

Ensure they are all prefixed with timestamps.  The resulting solution should
be maintainable and testable.


## Testing with Docker

The necessary repositories and setup exist in `/challenges/challenge4/picard`:

```bash
$ docker run -v /:/myroot --rm -it wschroeder/mgi-apps-work-test bash
root@uuid:/challenges# cd challenge4/picard
```

To build:

```
root@uuid:/challenges/challenge4/picard# ant
```

To run:
```
root@uuid:/challenges/challenge4/picard# java -jar dist/picard.jar ViewSam HEADER_ONLY=true I=http://www.ebi.ac.uk/arrayexpress/files/E-MTAB-3279/E-MTAB-3279.Col0_C1.snp.concordant_uniq.sorted.bam
```

At the time of writing, a sample BAM file exists at the example URL provided.
If any issues arise with this link, which we do not control, you may need to
find another BAM or a way to simulate it.  The contents of the BAM are
unimportant to the success of this task.


## Submission

You may submit your answer as a full set of git patches:

```
root@uuid:/challenges/challenge4/picard# git format-patch 2.2.1
0001-Do-not-require-a-github-login.patch
0002-Your-first-patch.patch
# ...

root@uuid:/challenges/challenge4/picard# cp 0* /myroot/path/to/shared/dir
```


## Notes

The Docker image is stocked with the vim, emacs, and nano editors.

