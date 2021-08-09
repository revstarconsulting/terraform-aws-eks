/*
resource "helm_release" "datadog" {
  count = var.manage_helm ? 1 : 0
  name  = "datadog-${var.environment}"

  repository = "https://helm.datadoghq.com"
  chart      = "datadog"
  version    = var.datadog_version

  namespace = var.datadog_namespace
  values = [
    "${file(var.datadog_helm_file)}"
  ]
}

resource "helm_release" "splunk" {
  count = var.manage_helm ? 1 : 0
  name  = "datadog-${var.environment}"

  repository = "https://splunk.github.io/splunk-connect-for-kubernetes/"
  chart      = "splunk"
  version    = var.splunk_version

  namespace = var.splunk_namespace
  values = [
    "${file(var.splunk_helm_file)}"
  ]
}
*/