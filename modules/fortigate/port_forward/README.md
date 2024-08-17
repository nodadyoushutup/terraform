
# FortiGate Port Forward Module

This Terraform module allows you to set up port forwarding in a FortiGate device using the FortiOS provider. It leverages existing VIP and Firewall Policy modules.

## Usage

To use this module, include it in your Terraform configuration as follows:

```hcl
module "port_forward" {
  source = "./modules/fortigate/port_forward"

  mappedport = 8080
  fosid      = 1
  name       = "my-port-forward"
  extport    = 1000
  mappedip = {
    range = "192.168.1.10-192.168.1.20"
  }
  dstaddr = {
    name = "internal-server"
  }
}
```

## Inputs

| Name        | Description                                                  | Type   | Default                          | Required |
|-------------|--------------------------------------------------------------|--------|----------------------------------|----------|
| `mappedport`| Port number on the internal network that the service is running on | `number`| `80`                             | No       |
| `fosid`     | Unique identifier for the FortiOS object                      | `number`| `100`                            | No       |
| `name`      | Name of the VIP and the Firewall policy                       | `string`| `"truenas"`                      | No       |
| `extport`   | External port number to be used for accessing the service     | `number`| `100`                            | No       |
| `mappedip`  | Mapped IP address range for the VIP                           | `object`| `{ range = "192.168.1.10-192.168.1.20" }` | Yes  |
| `policyid`  | Policy ID for the firewall policy                             | `number`| `100`                            | No       |
| `dstaddr`   | Destination address name for the firewall policy              | `object`| `{ name = "internal-server" }`   | Yes      |

## Outputs

This module does not have any outputs.

## License

This module is licensed under the MIT License. See the [LICENSE](LICENSE) file for more information.
