---
icon: material/file-certificate-outline
title: Self-Signed Certificates
subtitle: SSL for Your Local Server
hide:
  - toc
---
![Material Design file-certificate-outline icon](../assets/icons/file-certificate.svg){ width=200 }

# Self-Signed Certificates

*SSL for Your Local Server*

> [!question] FAQ
> **What is an SSL certificate?**
> :    SSL certificates provide encryption for Web servers and applications... the 'S' in HTTPS. Self-Signed SSL certificates can be useful for testing, developmet, and for encrypting connections to internal Web servers. However, they should not be used for hosting services or applications publicly. For that use, you will need to obtain a certificate signed by a reputable CA. My favorite way to obtain a free SSL certificate signed by a CA is LetsEncrypt. On this page is a step-by-step guide to creatinng your own self-signed SSL certificate using the Linux command line.

---

## :material-monitor-arrow-down-variant: Install OpenSSL

The first step is to install the OpenSSL package, providing the tools necessary for generating SSL certificates. Most Linux distributions already have this package in their repos, so installing the package is a simple command away with the built-in package manager. 

1. Install the `openssl` package with the following commands:

    **Debian / Ubuntu**

    ```bash linenums="1"
    sudo apt update
    sudo apt install openssl
    ```

    **Fedora / RHEL**

    ```bash linenums="1"
    sudo yum install openssl
    # or 
    sudo dnf install openssl
    ```

## :material-key: Generate a Private Key

After installing OpenSSL, next we need to generate a private key. Private keys are an essential component of an SSL certificate because they encrypt and decrypt the data. Make sure you keep the private key in a secure location. It is crucial for maintaining the security of your certificate.

1. Use the following command to generate a new 2048-bit RSA private key: 

    ```bash linenums="1"
    openssl genrsa -out <example.key> 2048  # (1)!
    ```

    1. Replace `example.key` with your preferred file name.

## :material-draw-pen: Certificate Signing Request

Now that we have a private key, we need to create a Certificate Signing Request. The CSR contains information about your server and organization. When you run the command you will be asked to enter a bunch of details. *(e.g., country, state, locality, organization name, common name (domain name), and email address)* Make sure you enter these details properly because they will be used to create the certificate. Especially, the domain name. It is very important for the domain name to match the server the certificate will be used for. 

1. Use the following command to create the CSR:

    ```bash linenums="1"
    openssl req -new -key <example.key> -out <example.csr>  # (1)!
    ```

    1. Replace `example.key` with the file name of the key you generated previously, and replace `example.csr` with your preferred file name for the CSR. I usually give them both the same file name to keep it simple.

## :material-file-certificate-outline: Generate the Certificate

Now that we have the private key and the CSR we have the pieces we need to generate a self-signed certificate. 

1. Use the following command to generate a self-signed certificate: 

    ```bash linenums="1"
    openssl x509 -req -days 365 -in <example.csr> -signkey <example.key> -out <example.crt>  # (1)!
    ```

    1. Replace `example.csr` and `example.key` with the file names you chose previously, and replace `example.crt` with your preferred file name for the certificate. Again, I usually use the same file name for everything to keep it simple. 

    | Option      | Description                                                                                       |
    | :---------- | :------------------------------------------------------------------------------------------------ |
    | `x509`      | The command to perform certificate operations. *(e.g., signing, generating, and displaying info)* |
    | `-req`      | Tells OpenSSL to treat the input file as a CSR and not a certificate.                             |
    | `-days 365` | Specifies the validity period of the certificate in days.                                         |
    | `-in`       | Specifies the input file to be used.                                                              |
    | `-signkey`  | Specifies the private key that will be used to sign the certificate.                              |
    | `-out`      | Specifies the file name for the output signed certificate file.                                   |

## :material-file-cog-outline: Configure the Web Server

The process to configure your Web server to use your new self-signed certificate will vary depending on the server you are using. *(e.g., Nginx, Apache, etc.)* Check the documentation for your specific Web server, then update the configuration file with the directory path of your certificate. 

Self-signed certificates should never be used for production environments, but they are great for testing, development, and internal servers. Just keep in mind that you will recieve warnings in your web browser that say you have an invalid certificate. This is because we have signed our certificate ourselves. The browsers have a certificate store full of trusted root Certificate Authorities, and your self-signed certificate does not match any of them. You can at least tell your browser to quit warning you about the certificate. 