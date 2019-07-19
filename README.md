# Kafka client docker image

KSQL + kafka client

## Prerequisites

This project is dependent on the following libs and programs:

- docker v1.18

## Developing

### Building

Run:

```sh
./build_docker_image.sh
```

This will create `kafka-client:dev` image

### Running

Run:

```sh
./run_docker_image.sh <commnad>
```

This will run `<command>` inside `kafka-client:dev` image
e.g. to start KSQL client:

```sh
./run_docker_image.sh ksql
```

## Contributing

Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our the process for submitting pull requests
and code of conduct.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.
