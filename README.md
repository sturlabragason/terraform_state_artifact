# terraform_state_artifact

[![Terraform State Artifact](https://github.com/sturlabragason/terraform_state_artifact/actions/workflows/terraform.yml/badge.svg)](https://github.com/sturlabragason/terraform_state_artifact/actions/workflows/terraform.yml)

The [`sturlabragason/terraform_state_artifact`](https://github.com/sturlabragason/terraform_state_artifact) action is a composite action that stores your Terraform state file as an encrypted Github workflow artifact and downloads and decrypts the state on subsequent runs. Built-in are the actions: [`actions/checkout@v2`](https://github.com/actions/checkout), [`hashicorp/setup-terraform@v1`](https://github.com/hashicorp/setup-terraform) and [`actions/upload-artifact@v2`](https://github.com/actions/upload-artifact).

## Usage

```yaml
steps:
- uses: sturlabragason/terraform_state_artifact@v1
    with:
        encryptionkey: ${{ secrets.encryptionkey }}
```

You can choose to skip `terraform apply`:

```yaml
steps:
- uses: sturlabragason/terraform_state_artifact@v1
    with:
        encryptionkey: ${{ secrets.encryptionkey }}
        apply: false
```

You can choose to add custom flags to `terraform plan`:

```yaml
steps:
- uses: sturlabragason/terraform_state_artifact@v1
    with:
        encryptionkey: ${{ secrets.encryptionkey }}
        apply: false
        custom_plan_flags: '-refresh-only'
```

You can choose to add custom flags to `terraform apply`:

```yaml
steps:
- uses: sturlabragason/terraform_state_artifact@v1
    with:
        encryptionkey: ${{ secrets.encryptionkey }}
        custom_apply_flags: '-no-color'
```

## Inputs

The action supports the following inputs:

| Variable        | Description                                                                                                                             | Default |
|-----------------|-----------------------------------------------------------------------------------------------------------------------------------------|---------|
| `encryptionkey` | An encryption key to use when encrypting the statefile. Recommended to use a secret value.                                              |   N/A   |
| `apply`         | (optional) Whether to run the `terraform apply` command.               | `true`  |
| `custom_plan_flags`         | (optional) Add a custom flag to the `terraform plan` command.               | `''`  |
| `custom_apply_flags`         | (optional) Add a custom flag to the `terraform apply` command.               | `''`  |

## License

[GNU General Public License v3.0](https://github.com/sturlabragason/terraform_state_artifact/blob/main/LICENSE)
