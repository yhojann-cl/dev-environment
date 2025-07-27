$TTL    86400
@       IN      SOA         ns1.example.com. admin.example.com. 2025062801 3600 1800 1209600 86400
        IN      NS          ns1.example.com.
@       IN      A           192.0.2.1
@       IN      AAAA        2001:db8::1
@       IN      AFSDB       1 afsdb.example.com.
@       IN      APL         1:192.0.2.0/24 !1:198.51.100.0/24
@       IN      CAA         0 issue "letsencrypt.org"
; @     IN      CDNSKEY     ...
@       IN      CDS         44954 8 2 2A1B3C4D5E6F7890ABCDEF1234567890ABCDEF1234567890ABCDEF1234567890
@       IN      CERT        1 0 0 MIIBwjCCAWqgAwIBAgIUWUDbZliLoXxUQta1HOnJCNKpgUYwDQYJKoZIhvcNAQELBQAwEjEQMA4GA1UEAwwHZXhhbXBsZTAeFw0yNTA2MjkwMDAwMDBaFw0zMTA2MjkwMDAwMDBaMBIxEDAOBgNVBAMMB2V4YW1wbGUwWTATBgcqhkjOPQIBBggqhkjOPQMBBwNCAASxVqYukSL6bbdV3qwbXfNjOp6zZqkw+IF7J+9ZFL98+q+L2OLArZq9+uGb5YgNDVZJ5ldEsVmPiYYzQZlMUtGjo2MwYTAdBgNVHQ4EFgQUK+JkqCGrlgDbiuNYCWyCU9H4MPowHwYDVR0jBBgwFoAUK+JkqCGrlgDbiuNYCWyCU9H4MPowDwYDVR0TAQH/BAUwAwEB/zANBgkqhkiG9w0BAQsFAAOCAQEAbmKwhKyhA+vkh6QCKNHH8zH1zqC9V7Hc3V4fLvJCrUIn7pP4MIEaUJ9EtnBzjN+kkW0j6ZcyKe2GC+KXQ0gUMAcHH1cCwhLyArvLNdAkeYFj10U2e3v2LJq4OdYqYZMgRgmr0lW1CjFTakA7GqD2yZbEfXOpIl5LlyEFoY+CX7t8gMRIFNZXi6iG+nDdPUu3qgBiMG3ErbYShhBAb4S0cX4Z3zFwCSWhhnMW0RPraZcH59c7smw1LJcMlvvK8aWLO+zZ3bNH2Od4gxVtkU8U0rm5js3GZqZrA2x8Y6uxM5Fz6EKR6jNMoL4RxNaH9RzYDNgeqwn5Yp1KOlALAw==
www     IN      CNAME       example.com.
; @     IN      CSYNC       2025062801 3 0
@       IN      DHCID       AQAAABxkbGxhcHAwMQAxMC4xMC4xMC4xMDA=
@       IN      DLV         15358 8 2 0C5AD18E806105AF7B44F86E02D333950D3CAE5F86A4F703BB3C4E848B846844
; @     IN      DNAME       subdomain.example.net.
@       IN      DNSKEY      256 3 8 AwEAAcKaSwN4wuIJrTaqj8nZ8HSQ5Yyf8TNDA0qzbZ959CnLIVhIYilhUQJCOS4HK0fVFI4B1fg2dMYU90NkjEeDbI8qjynARS5urLxhxk/boLXAXRcYojgXgBziKL3Txc7KeaRovRpczVweHIVbACFrZisIq84ISUdrLxObcLctOAcZFM8I8zcbEzAuao9g4pp9ekjJ5RyPTt41g+TK0FDqIIc/NQzDZryGSxhQAgoGqMeNV0U9F/mF2HHa9vvbrlgCoI9yR1YBTbHnZ1SzOAmeca4YQHNHWK8YsffFnJtpE8sAMY6ofjnOT+kBKtPuLDwayKOByMTl1BQR8tYEx3k1Qnc=
; @     IN      DS          15358 8 2 0C5AD18E806105AF7B44F86E02D333950D3CAE5F86A4F703BB3C4E848B846844
@       IN      EUI48       00-25-96-FF-FE-12
@       IN      EUI64       00-25-96-FF-FE-12-34-56
@       IN      HINFO       "Intel" "Linux"
@       IN      HIP         2 2A1B3C4D5E6F7890ABCDEF1234567890 MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAoPWl0I0Kvz6Vzi1+47W5HyJSEIwEVO3CWQD/tUzCcKfOnAeEL/x7yU1r3AHkpOx+O3frSspsYQtiSZD+61U76RrRH0+yNm2OZbFb47IC4xwn0gJPa6pAZ8whf06qtT/ATdN6ShIJ3uKSzB2fcgHRRr2wn1PvNFDmB0fiCqaUkEZTGr2znIYNIT1l+aXJPloiW9xO7Gn0Rt4TaeeVuBPZuMs3yt/r/GA3vG7nO4pXnBZJKT1SAYpBvDflI61Tn94NaLqsnuCMt3MC9Hfo9MHLwLhcZtP4n4dw6AEQS01ZuJdBE64ZXSjjQcnLOgxLTZrmmxuZiUGl+AAKR70q0yHifwIDAQAB rendezvous.example.com.
@       IN      HTTPS       1 . alpn="h2,h3" port=443 ipv4hint=192.0.2.1 ipv6hint=2001:db8::1
@       IN      IPSECKEY    10 1 2 192.0.2.1 AQPSKmynfzW4kyBv015MUG2DeIQ3AsA+z8hxAjxI/WkP
@       IN      KEY         256 3 8 AwEAAcKaSwN4wuIJrTaqj8nZ8HSQ5Yyf8TNDA0qzbZ959CnLIVhIYilhUQJCOS4HK0fVFI4B1fg2dMYU90NkjEeDbI8qjynARS5urLxhxk/boLXAXRcYojgXgBziKL3Txc7KeaRovRpczVweHIVbACFrZisIq84ISUdrLxObcLctOAcZFM8I8zcbEzAuao9g4pp9ekjJ5RyPTt41g+TK0FDqIIc/NQzDZryGSxhQAgoGqMeNV0U9F/mF2HHa9vvbrlgCoI9yR1YBTbHnZ1SzOAmeca4YQHNHWK8YsffFnJtpE8sAMY6ofjnOT+kBKtPuLDwayKOByMTl1BQR8tYEx3k1Qnc=
@       IN      KX          10 mail-keys.example.com.
@       IN      LOC         37 47 0.000 N 122 24 0.000 W 10.00m 1m 10000m 10m
@       IN      MX          10 mail1.example.com.
@       IN      MX          20 mail2.example.com.
@       IN      NAPTR       100 10 "U" "E2U+sip" "!^.*$!sip:info@example.com!" .
@       IN      NS          ns1.example.com.
@       IN      NS          ns2.example.com.
@       IN      NSEC        othername.example.com. A AAAA RRSIG NSEC
; @     IN      NSEC3       1 0 5 ABCD1234 1K8BFA5I4L7F3K8M2J4D8S5TKP9P9S3L NS DS RRSIG
@       IN      NSEC3PARAM  1 0 5 ABCD1234
; @     IN      OPENPGPKEY  mQENBFnD5b8BCAC3MdXGK9SBz0CJHeFbPiwXU/jk1ePKGu4x+1tI9zhb+L8C0mjQd34r4tWObzUX3JbPnbAxPUE6XnRxMGY=
; 1.2.0.192.in-addr.arpa. IN PTR @
@       IN      RP          hostmaster.example.com. admin-contact.example.com.
; @     IN      RRSIG       A 8 2 3600 20250630000000 20250601000000 12345 example.com. H1b8z2Fnm/5K9R6/B3DhLFZDf6RZ1PM4U6Gnq9Ml+H2Y+XQ4FZc9aW==
; @     IN      SIG         A 5 3 3600 20250630000000 20250601000000 12345 example.com. AbCdEf1234567890AbCdEf1234567890==
@       IN      SMIMEA      3 1 1 D2C9F0A58923A13DC2E40BB6AB7D23C23E4C9012A657239F12D6A0B5E8659A4D
@       IN      SRV         10 20 5060 sipserver.example.com.
@       IN      SSHFP       1 1 D2ABDE240D7CD3EE6B4B28A1E9E7D4C3C2C9344A
@       IN      SVCB        1 svc.example.net. alpn="h2" port=443 ipv4hint=192.0.2.1
@       IN      TA          12345 8 2 2A1B3C4D5E6F7890ABCDEF1234567890ABCDEF1234567890ABCDEF1234567890
; @     IN      TKEY        tkey.example.com. 5 3 20250629000000 20250630000000 ABCDEFGHIJKLMNOP
; @     IN      TLSA        3 1 1 D2C9F0A58923A13DC2E40BB6AB7D23C23E4C9012A657239F12D6A0B5E8659A4D
; keyname. IN TSIG hmac-sha256. 20250629000000 300 1234567890abcdef1234567890abcdef 9876543210abcdef9876543210abcdef
@       IN      TXT         "v=spf1 include:_spf.example.com ~all"
@       IN      URI         10 1 "https://example.com/service"
; @     IN      ZONEMD      2025062801 1 1 5E2A43F9A63E6DE98301D3EC8327AB3AB4D80D91CBF3488ED12E0DA9AA8C4B58

ns1        IN  A  192.0.1.1
ns2        IN  A  192.0.1.2
mail1      IN  A  192.0.1.1
mail2      IN  A  192.0.1.2
sipserver  IN  A  192.0.1.1

; Obsolete
; @       IN      MD          mailserver.example.com.
; @       IN      MF          fallback-mail.example.com.
; @       IN      MAILA       mailalias.example.com.
; @       IN      MAILB       mailboxhost.example.com.
; @       IN      MB          mailbox.example.com.
; @       IN      MG          group@example.com.
; @       IN      MR          replacement@example.net.
; @       IN      MINFO       rmailbx adminbox.example.com.
; @       IN      WKS         192.0.2.1 TCP smtp
; @       IN      NB          NBHOST.example.com.
; @       IN      NBSTAT      NBHOST.example.com.
; @       IN      NULL        \# 4 DEADBEEF
; @       IN      A6          64 2001:db8::1234 example.com.
; @       IN      NXT         example.net. A MX SIG NXT
; @       IN      X25         PSDN-address-string
; @       IN      ISDN        15085551234
; @       IN      RT          10 intermediate-router.example.com.
; @       IN      NSAP        0x47000580ffff0000000001
; @       IN      NSAP-PTR    nsapname.example.com.
; @       IN      PX          10 20 relay.example.com. map.example.com.
; @       IN      EID         \# 8 01AABBCCDDEEFF00
; @       IN      NIMLOC      \# 8 1122334455667788
; @       IN      ATMA        49.0077.0000.0001.2345.6789.00
; @       IN      SINK        \# 0
; @       IN      GPOS        37.77 -122.42 10.00
; @       IN      UINFO       "Sysadmin"
; @       IN      UID         12345
; @       IN      GID         54321
; @       IN      UNSPEC      \# 4 DEADBEEF
; @       IN      SPF         "v=spf1 +a +mx include:_spf.example.com ~all"
; @       IN      NINFO       "Servidor no admite recursión"
; @       IN      RKEY        \# 10 1234567890ABCDEF00
; @       IN      TALINK      key.example.com. signer.example.com.
; @       IN      NID         10 2001:db8::1
; @       IN      L32         10 192.0.2.1
; @       IN      L64         10 2001:db8::1
; @       IN      LP          10 endpoint.example.com.
; @       IN      DOA         1 10 "urn:example:object:1234"
