# terraform-state-artifact

[![Terraform State Artifact](https://github.com/devgioele/terraform-state-artifact/actions/workflows/integration.yml/badge.svg)](https://github.com/devgioele/terraform-state-artifact/actions/workflows/integration.yml)

An action that stores your Terraform state file as an encrypted Github workflow artifact and downloads and decrypts the state on subsequent runs.

Be aware that [Github delets artifacts older then 90 days](https://docs.github.com/en/organizations/managing-organization-settings/configuring-the-retention-period-for-github-actions-artifacts-and-logs-in-your-organization) by default. You can [run your pipeline on a schedule](https://docs.github.com/en/actions/learn-github-actions/events-that-trigger-workflows#scheduled-events) to create a new artifact at least once every 90 days.

## Usage

```yaml
steps:
- uses: devgioele/terraform-state-artifact@v3
    with:
        passphrase: ${{ secrets.TF_STATE_PASSPHRASE }}
```

Using OpenSSL 1.1.1, a key can be generated with:
```
openssl enc -aes-256-cbc -k <secret> -P -md sha256 -pbkdf2
```
Replace `<secret>` with some password.
Copy the key from the output and use it as a GitHub secret named `TF_STATE_PASSPHRASE`.

## Inputs

The action supports the following inputs:

| Variable        | Description                                                                                                                             | Default |
|-----------------|-----------------------------------------------------------------------------------------------------------------------------------------|---------|
| `passphrase` | A passphrase to encrypt and decrypt the statefile artifact.                       | N/A |
| `download-upload`         | Whether to download and decrypt or upload and encrypt.               | N/A |
| `statefile-location`         | (optional) The location of your Terraform statefile.              | `''` |

## Credits

This action would not have been possible without [the previous work done by sturlabragason](https://github.com/sturlabragason/terraform_state_artifact). I created a fork instead of a PR, because I wanted my changes to take immediate effect.

## License

[GNU General Public License v3.0](https://github.com/devgioele/terraform-state-artifact/blob/main/LICENSE)
