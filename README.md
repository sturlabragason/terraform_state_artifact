# terraform_state_artifact

[![Terraform State Artifact](https://github.com/sturlabragason/terraform_state_artifact/actions/workflows/terraform.yml/badge.svg?branch=main)](https://github.com/sturlabragason/terraform_state_artifact/actions/workflows/terraform.yml)

The [`sturlabragason/terraform_state_artifact`](https://github.com/sturlabragason/terraform_state_artifact) action is a composite action that stores your Terraform state file as an encrypted Github workflow artifact and downloads and decrypts the state on subsequent runs. Built-in are the actions: [`actions/checkout@v2`](https://github.com/actions/checkout), [`hashicorp/setup-terraform@v1`](https://github.com/hashicorp/setup-terraform) and [`actions/upload-artifact@v2`](https://github.com/actions/upload-artifact).

## Usage

```yaml
steps:
- uses: sturlabragason/terraform_state_artifact@main
    with:
        encryptionkey: ${{ secrets.encryptionkey }}
```

You can choose to run only plan or apply

```yaml
steps:
- uses: sturlabragason/terraform_state_artifact@main
    with:
        encryptionkey: ${{ secrets.encryptionkey }}
        plan: true
        apply: false
```

## Inputs

The action supports the following inputs:

| Variable        | Description                                                                                                                             | Default |
|-----------------|-----------------------------------------------------------------------------------------------------------------------------------------|---------|
| `encryptionkey` | An encryption key to use when encrypting the statefile. Recommended to use a secret value.                                              | N/A     |
| `plan`          | (optional) Whether to run the `terraform plan` command. If `apply` is set to false it will output a plan file under `./terraform.plan`. | `true`  |
| `apply`         | (optional) Whether to run the `terraform apply` command. If `plan` is set to false it will use a plan `./terraform.plan`.               | `true`  |

## License

[GNU General Public License v3.0](https://github.com/sturlabragason/terraform_state_artifact/blob/main/LICENSE)
