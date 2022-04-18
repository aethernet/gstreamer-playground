# gstreamer-playground

Balena-based gstreamer debug and profiling setup

`gstreamer` is incredibly powerful but notoriously hard to learn, use and debug.

This project aim is to help debug and profile gstreamer pipeline.

This is a work in progress (aka this repo is empty)

## Architecture

This should run on either ARMv7 ARM64 and x86 architecture.

## What's inside ?

- `ubuntu`
- `gstreamer`
- `gstreamer-plugins-good`
- `gstreamer-plugins-bad`
- `gstreamer-plugins-ugly`
- `nodejs`
- `gstreamer-superficial` (npm package)
- `REST Api to control gstreamer`
- `gst-shark`
- `graphviz`

## Visualizing a pipeline

Natively gstreamer can output a description of a pipe as a `.dot` file.

To turn on this feature you need to set `GST_DEBUG_DUMP_DOT_DIR` env to the output directory and run your pipe.

Once it done, you can turn the `dot` file into a `png` using graphviz :
`dot -Tpng PATH/TO/YOUR/FILE.dot > pipeline.png`
