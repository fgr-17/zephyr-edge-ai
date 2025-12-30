# zephyr-edge-ai

Research on TF Lite Micro running on Zephyr.
Based on tflite-micro `hello-world` example

## Usage

Create the container and get into it:

~~~bash
docker compose up -d
docker exec -it zephyr-app-template bash
~~~

Compiling the app

~~~bash
west init -l hello-world
west update
west build -b qemu_x86 -s hello_world
~~~

## Contributing

Pull requests are welcome. For major changes, please open an issue first
to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License

[MIT](https://choosealicense.com/licenses/mit/)