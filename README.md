### docker copr-cli

[copr](https://copr.fedoraproject.org/) (Cool Other Package Repositories) is a Fedora community build service for RPMs.

This Docker image contains the copr-cli tool which can be used to submit SRPMs to copr for building (among other things).

### Usage

Supply the following environment variables to docker run:

```
COPR_LOGIN=
COPR_USERNAME=
COPR_TOKEN=
COPR_URL=
```

You can get the necessary values for your account at https://copr.fedoraproject.org/api/

### Example

Suppose your SRPM is located at ```/home/myuser/SRPMS/foobar.src.rpm```

```
docker run -it --rm \
  -v home/myuser/SRPMS/:/build/ \
  -e COPR_LOGIN=edwfnbwekdnweo \
  -e COPR_USERNAME=myuser \
  -e COPR_TOKEN=dsifhweiohdfisaucnhiwsg \
  -e COPR_URL=https://copr.fedoraproject.org \
  mgruener/copr-cli \
  build myuser/foobar /build/foobar.src.rpm
```

This will send the SRPM ```foobar.src.rpm``` to be build for project ```foobar``` of user ```myuser```. See the copr-cli manpage for details on what other operations are possible.

### Motivation

The main reason for this docker image is to have an easy ability to send build jobs to copr from a [Travis-CI](https://travis-ci.org/) build job as travis-ci does not provide a nativ copr integration right now.
