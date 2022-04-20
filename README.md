# gstreamer-playground

Balena-based gstreamer debug and profiling setup

`gstreamer` is incredibly powerful but notoriously hard to learn, use and debug.

This project aim is to help debug and profile gstreamer pipeline.

This is a work in progress

## Architecture

This should run on either ARMv7, ARM64 and x86 architecture.

## What's inside ?

- `ubuntu`
- `gstreamer`
- `gstreamer-plugins-good`
- `gstreamer-plugins-bad`
- `gstreamer-plugins-ugly`
- `gst-shark`
- `graphviz`
- `v4l-utils`
- `mkvtoolnix`
- `alsa`
- `xserver` ([balenablocks/xserver](https://hub.balena.io/balenablocks/xserver))
- `files` ([edwin3/files](https://hub.balena.io/edwin3/files))

## Running a pipe using `gst-launch`

Connect using `ssh` (either thru balena cli or cloud) into the service.

Use `gst-launch-1.0 -ve YOUR ! TEST ! PIPE`. Let it run as long as you need, press `CTRL+C` to interupt it.

## Log level

Log level is set to 3 (FIXME) by default.
You can change it to any level using the `GST_DEBUG` environment variable (in docker-compose.yml, balena cloud, or in the running container).

Valid Levels are 0 to 9, check the [`gstreamer` doc](https://gstreamer.freedesktop.org/documentation/tutorials/basic/debugging-tools.html?gi-language=c) for more infos.

## Visualizing a pipeline

Thanks to `GST_DEBUG_DUMP_DOT_DIR` env var set in docker-compose.yml, `gstreamer` will output a `dot` file at each change of pipeline status. (PREROLL, RUNNING, ...).

Those `dot` files are stored in `/files` which are served on port 80 by `edwin3/files` block.

You can turn those to `png` of `pdf` with the following command :

`dot -Tpng /files/DOT_FILE_OF_INTEREST.dot > /files/pipeline.png`

or

`dot -Tpdf /files/DOT_FILE_OF_INTEREST.dot > /files/pipeline.pdf`
