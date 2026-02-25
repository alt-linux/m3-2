openssl req -x509 -new -nodes -keyout /etc/pki/CA/private/ca.key -out /etc/pki/CA/certs/ca.crt -days 3650 -sha256 -subj "/CN=AU-TEAM Root CA"
openssl genrsa -out /etc/pki/CA/private/web.au-team.irpo.key 2048
openssl genrsa -out /etc/pki/CA/private/docker.au-team.irpo.key 2048
openssl req -new -key /etc/pki/CA/private/web.au-team.irpo.key -out /etc/pki/CA/newcerts/web.au-team.irpo.csr -subj "/CN=web.au-team.irpo"
openssl req -new -key /etc/pki/CA/private/docker.au-team.irpo.key -out /etc/pki/CA/newcerts/docker.au-team.irpo.csr -subj "/CN=docker-team.irpo"
cp /down/web.cnf /etc/ssl/
openssl ca -config /etc/ssl/web.cnf -in /etc/pki/CA/newcerts/web.au-team.irpo.csr -out /etc/pki/CA/certs/web.au-team.irpo.crt -extensions server_cert -batch
openssl ca -config /etc/ssl/web.cnf -in /etc/pki/CA/newcerts/docker.au-team.irpo.csr -out /etc/pki/CA/certs/docker.au-team.irpo.crt -extensions server_cert -batch
cp /etc/pki/CA/certs/ca.crt /raid/nfs
cp /etc/pki/CA/certs/web.au-team.irpo.crt /raid/nfs
cp /etc/pki/CA/private/web.au-team.irpo.key /raid/nfs
cp /etc/pki/CA/certs/docker.au-team.irpo.crt /raid/nfs
cp /etc/pki/CA/private/docker.au-team.irpo.key /raid/nfs
echo "chmod 777 /raid/nfs/web.au-team.irpo.key"
echo "chmod 777 /raid/nfs/docker.au-team.irpo.key"
echo "Na hq-cli v terminale roota pishem 2 commands"
echo "cp /mnt/nfs/ca.crt /etc/pki/ca-trust/source/anchors"
echo "update-ca-trust"
echo "Zatem"
echo "Na hq-cli podkl 4erez ssh k isp zaxod v root u bash m3-isp-2-3.sh"