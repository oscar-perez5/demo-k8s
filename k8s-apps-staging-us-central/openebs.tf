### TODO pending to enable OpenEBS
#locals {
#  env = {
#    OPENEBS_IO_ENABLE_ANALYTICS         = "true"
#    OPENEBS_IO_NFS_SERVER_USE_CLUSTERIP = "true"
#    OPENEBS_IO_INSTALLER_TYPE           = "openebs-operator-nfs"
#  }
#}

#resource "helm_release" "openebs" {
#  name             = "openebs"
#  namespace        = "openebs"
#  create_namespace = true
#  repository       = "https://openebs.github.io/charts"
#  chart            = "openebs"
#  version          = "2.8.0"
#}

#resource "kubernetes_deployment" "nfs" {
#  metadata {
#    name      = "openebs-nfs-provisioner"
#    namespace = helm_release.openebs.namespace
#    labels = {
#      name                        = "openebs-nfs-provisioner"
#      "openebs.io/component-name" = "openebs-nfs-provisioner"
#      "openebs.io/version"        = "dev"
#    }
#  }
#
#  spec {
#    selector {
#      match_labels = {
#        name                        = "openebs-nfs-provisioner"
#        "openebs.io/component-name" = "openebs-nfs-provisioner"
#      }
#    }
#    replicas = 1
#    strategy {
#      type = "Recreate"
#    }
#
#    template {
#      metadata {
#        labels = {
#          name                        = "openebs-nfs-provisioner"
#          "openebs.io/component-name" = "openebs-nfs-provisioner"
#          "openebs.io/version"        = "dev"
#        }
#      }
#
#      spec {
#        service_account_name = "openebs"
#        container {
#          image = "openebs/provisioner-nfs-amd64:ci"
#          name  = "openebs-provisioner-nfs"
#          env {
#            name = "NODE_NAME"
#            value_from {
#              field_ref {
#                field_path = "spec.nodeName"
#              }
#            }
#          }
#          env {
#            name = "OPENEBS_NAMESPACE"
#            value_from {
#              field_ref {
#                field_path = "metadata.namespace"
#              }
#            }
#          }
#          env {
#            name = "OPENEBS_SERVICE_ACCOUNT"
#            value_from {
#              field_ref {
#                field_path = "spec.serviceAccountName"
#              }
#            }
#          }
#
#          dynamic "env" {
#            for_each = local.env
#
#            content {
#              name  = env.key
#              value = env.value
#            }
#          }
#          liveness_probe {
#            exec {
#              command = ["sh", "-c", "test `pgrep -c \"^provisioner-nfs.*\"` = 1"]
#            }
#
#            initial_delay_seconds = 30
#            period_seconds        = 60
#          }
#        }
#      }
#    }
#  }
#  depends_on = [
#    helm_release.openebs
#  ]
#}
