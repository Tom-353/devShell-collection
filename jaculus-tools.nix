{
  lib,
  buildNpmPackage,
  fetchFromGitHub,
}:

buildNpmPackage (finalAttrs: {
  pname = "jaculus-tools";
  version = "0.0.23";

  src = fetchFromGitHub {
    owner = "cubicap";
    repo = "Jaculus-tools";
    tag = "v${finalAttrs.version}";
    hash = "sha256-CKn37CHtxYx/CTC9zdm1+Hz+79tDdQIzwjE2FAfL+hg=";
  };

  npmDepsHash = "sha256-eQRVRMsBMqArTnAoDHXKjTnOBfbp1FbMkr2gFbC0qdg=";

  # The prepack script runs the build script, which we'd rather do in the build phase.
  npmPackFlags = [ "--ignore-scripts" ];

  NODE_OPTIONS = "--openssl-legacy-provider";

  postInstall = ''
    mkdir -p $out/share/bash-completion/completions
    echo 'complete -W "help list-ports serial-socket install build flash pull ls read write rm mkdir rmdir upload
    format resources-ls resources-read get-examples start stop status version monitor wifi-get wifi-ap wifi-add wifi-rm
    wifi-sta wifi-disable --log-level --help --port --baudrate --socket" jac' > $out/share/bash-completion/completions/jac
  '';

  meta = {
    description = "Jaculus tools allow for uploading and downloading files, as well as controlling the running Jaculus runtime on the device.";
    homepage = "https://jaculus.org";
    license = lib.licenses.gpl3Only;
  };
})

