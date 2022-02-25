#!/usr/local/env python3

import json
import sys
import yaml
import argparse

parser = argparse.ArgumentParser()

parser.add_argument('--vpc-id', type=str,
                    dest='vpcid', required=True,
                    help="VPC id")

parser.add_argument('--public-a', type=str,
                    dest='public_a', required=True,
                    help="Subnet Id public az a")
parser.add_argument('--public-b', type=str,
                    dest='public_b', required=True,
                    help="Subnet Id public az b")

parser.add_argument('--private-a', type=str,
                    dest='private_a', required=True,
                    help="Subnet Id private az a")
parser.add_argument('--private-b', type=str,
                    dest='private_b', required=True,
                    help="Subnet Id private az b")


args = parser.parse_args()


def write_values(dict_file):
    with open(r'./cluster.yaml', 'a') as file:
        documents = yaml.dump(dict_file, file)


def get_and_write_output():
    data = {
        "vpc": {
            "id": "",
            "subnets": {
                "public": {
                    "eu-central-1a": {
                        "id": ""
                    },
                    "eu-central-1b": {
                        "id": ""
                    }
                },
                "private": {
                    "eu-central-1a": {
                        "id": ""
                    },
                    "eu-central-1b": {
                        "id": ""
                    }
                }
            }
        }
    }

    data["vpc"]["id"] = args.vpcid
    
    data["vpc"]["subnets"]["public"]["eu-central-1a"]["id"] = args.public_a
    data["vpc"]["subnets"]["public"]["eu-central-1b"]["id"] = args.public_b

    data["vpc"]["subnets"]["private"]["eu-central-1a"]["id"] = args.private_a
    data["vpc"]["subnets"]["private"]["eu-central-1b"]["id"] = args.private_b

    write_values(data)


def main():
    get_and_write_output()


if __name__ == "__main__":
    main()