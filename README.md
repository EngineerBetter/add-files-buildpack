# add-files-buildpack

A quick, tactical fix to add files to a droplet.

## Usage

1. Fork this repo
1. Add the files you want to `files/`
1. Commit and push
1. `cf push myapp -b https://github.com/YourFork/add-files-buildpack.git -b some_buildpack`
1. Files are in `/home/vcap/dep/0/`

## Testing

```terminal
$ CF_API=https://api.your.domain \
  CF_USERNAME=user \
  CF_PASSWORD=pass \
  CF_ORG=testorg \
  CF_SPACE=testspace \
  ./test.sh
```
