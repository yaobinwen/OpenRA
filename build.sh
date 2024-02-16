#!/bin/sh

whoami || exit

# Sanity check that we are in the OpenRA source code folder.
test -f "$PWD/OpenRA.sln" || {
	echo "'OpenRA.sln' is not found. Is this really the OpenRA source code folder?"
	exit 1
}

# Santity check that there is a Makefile.
test -f "$PWD/Makefile" || {
	echo "'Makefile' is not found. Is this really the OpenRA source code folder?"
	exit 1
}

# Try to work around this problem:
#
# /usr/lib/dotnet/sdk/6.0.127/NuGet.targets(130,5): error : Unable to load the service index for source https://api.nuget.org/v3/index.json. [/openra/OpenRA.sln]
# /usr/lib/dotnet/sdk/6.0.127/NuGet.targets(130,5): error :   The SSL connection could not be established, see inner exception. [/openra/OpenRA.sln]
# /usr/lib/dotnet/sdk/6.0.127/NuGet.targets(130,5): error :   The remote certificate is invalid because of errors in the certificate chain: UntrustedRoot [/openra/OpenRA.sln]
#
# https://learn.microsoft.com/en-us/aspnet/core/security/enforcing-ssl?view=aspnetcore-8.0&tabs=visual-studio%2Clinux-ubuntu#ubuntu-trust-the-certificate-for-service-to-service-communication
dotnet dev-certs https || exit
dotnet dev-certs https -ep /usr/local/share/ca-certificates/aspnet/https.crt --format PEM ||exit
update-ca-certificates || exit

# Build the code.
make || exit
