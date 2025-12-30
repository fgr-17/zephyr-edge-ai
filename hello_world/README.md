# Overview

This sample TensorFlow application replicates a sine wave and
demonstrates the absolute basics of using TensorFlow Lite Micro.

The model included with the sample is trained to replicate a sine
function and generates x values to print alongside the y values
predicted by the model. The x values iterate from 0 to an approximation
of 2π.

The sample also includes a full end-to-end workflow of training a model
and converting it for use with TensorFlow Lite Micro for running
inference on a microcontroller.

The sample comes in two flavors. One with TensorFlow Lite Micro
reference kernels and one with CMSIS-NN optimized kernels.

This README and sample have been modified from [the TensorFlow Hello
World sample for
Zephyr](https://github.com/tensorflow/tflite-micro/tree/main/tensorflow/lite/micro/examples/hello_world).

## Sample Output

``` console
...

x_value: 1.0995567*2^1, y_value: 1.6951603*2^-1

x_value: 1.2566366*2^1, y_value: 1.1527088*2^-1

x_value: 1.4137159*2^1, y_value: 1.1527088*2^-2

x_value: 1.5707957*2^1, y_value: -1.0849024*2^-6

x_value: 1.7278753*2^1, y_value: -1.0509993*2^-2

...
```

The modified sample prints 10 generated-x-and-predicted-y pairs. To see
the full period of the sine curve, increase the number of loops in
`main.c`.

# Modifying Sample for Your Own Project

It is recommended that you copy and modify one of the two TensorFlow
samples when creating your own TensorFlow project. To build with
TensorFlow, you must enable the below Kconfig options in your
`prj.conf`{.interpreted-text role="file"}:

``` cfg
CONFIG_CPP=y
CONFIG_REQUIRES_FULL_LIBC=y
CONFIG_TENSORFLOW_LITE_MICRO=y
```

Note that the CMSIS-NN kernel sample demonstrates how to use CMSIS-NN
optimized kernels with TensorFlow Lite Micro, in that is sets below
Kconfig option. Note also that this Kconfig option is only set for Arm
Cortex-M cores, i.e. option CPU_CORTEX_M is set.

``` cfg
CONFIG_TENSORFLOW_LITE_MICRO_CMSIS_NN_KERNELS=y
```

# Training

This repo contians an uv environment to ease the management of the dependencies.
To setup the environment you can run:

~~~bash
cd hello_world/train
uv sync
~~~

You should see a hidden dir called `.venv/` inside your [`train`](./train/) dir. 
That's the environment you must use for the notebook. 

The easiest way to run the notebook (if you want to avoid setting up a Jupyter 
server) is to use vsc or cursor extension:

1. Install Required Extensions: Ensure you have the "Jupyter" extension installed in vsc/cursor Also install the "Python" extension if not already present
2. Select the Python Interpreter: Open Command Palette (`Ctrl+Shift+P` / `Cmd+Shift+P`). Search for "Python: Select Interpreter". Look for and select your uv environment at `<path to repo>/hello_world/train/.venv/bin/python`

After that, you can follow the instructions in the [`train/README.md`](./train/README.md)
directory to train your own model for use in the sample.
