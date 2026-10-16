# delegation-program-leaderboard

![Version: 0.2.0](https://img.shields.io/badge/Version-0.2.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.16.0](https://img.shields.io/badge/AppVersion-1.16.0-informational?style=flat-square)

A Helm chart for Kubernetes

## Prerequisites

Before using this Helm chart, you should have the following prerequisites:

- Access to Kubernetes cluster (If needed contact your friendly neighbourhood DevOps engineer)
- Helm >= v3.14.3
- (**Optional**) helmfile >= v0.162.0 to install this chart

## Installation

> Note: **examples** can be found in the repository

To install this Helm chart, the easiest is to create a helmfile.yaml with needed values and run:

```
helmfile template
helmfile apply
```

Or use helmfile only to generate resources and apply them with kubectl like so:

```
helmfile template | kubectl -f -
```

Verify that the chart is deployed successfully:

> Note: `kubectl` is a better suited tool for this

```
helmfile status
```

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| delegationProgramDB.host | string | `"localhost"` | Delegation Program Database Host |
| delegationProgramDB.name | string | `"postgres"` | Delegation Program Database Name |
| delegationProgramDB.password | string | `"postgres"` | Delegation Program Database Password |
| delegationProgramDB.port | string | `"5432"` | Delegation Program Database Port |
| delegationProgramDB.user | string | `"postgres"` | Delegation Program Database User |
| fullnameOverride | string | `""` | The full release name override |
| ingress.annotations | object | `{}` | The Ingress Annotations |
| ingress.className | string | `""` | The Ingress Class Name to use |
| ingress.enabled | bool | `false` | Whether to create an Ingress |
| ingress.hosts | list | `[{"host":"chart-example.local"}]` | A list of DNS names to create for leaderboard service |
| ingress.tls | list | `[]` | The TLS configuration |
| leaderboardApi | object | `{"affinity":{},"cacheTimeout":300,"extraEnvVars":{},"image":{"pullPolicy":"IfNotPresent","repository":"673156464838.dkr.ecr.us-west-2.amazonaws.com/delegation-program-leaderboard-api","tag":"2.1.0"},"imagePullSecrets":[],"lifecycle":{"preStop":{"exec":{"command":["sh","-c","sleep 15 && kill -SIGQUIT 1"]}}},"logFile":"./application.log","nodeSelector":{},"podAnnotations":{},"podSecurityContext":{},"replicaCount":1,"resources":{},"securityContext":{},"service":{"port":5000,"type":"ClusterIP"},"swaggerUrl":"localhost:5000","tolerations":[]}` | configuration options for leaderboard api deployment |
| leaderboardApi.affinity | object | `{}` | Affinity rules |
| leaderboardApi.cacheTimeout | int | `300` | Application cache timeout in seconds |
| leaderboardApi.extraEnvVars | object | `{}` | Extra Environment Variables |
| leaderboardApi.image.pullPolicy | string | `"IfNotPresent"` | The pullPolicy used when pulling the image |
| leaderboardApi.image.repository | string | `"673156464838.dkr.ecr.us-west-2.amazonaws.com/delegation-program-leaderboard-api"` | The repository of the image |
| leaderboardApi.image.tag | string | `"2.1.0"` | The tag of the image. Overrides the image tag whose default is the chart appVersion. |
| leaderboardApi.imagePullSecrets | list | `[]` | The secrets used to pull the image |
| leaderboardApi.lifecycle | object | `{"preStop":{"exec":{"command":["sh","-c","sleep 15 && kill -SIGQUIT 1"]}}}` | Lifecycle hooks |
| leaderboardApi.logFile | string | `"./application.log"` | A path to an application log file |
| leaderboardApi.nodeSelector | object | `{}` | Node selector labels |
| leaderboardApi.podAnnotations | object | `{}` | Annotations to add to the pods |
| leaderboardApi.podSecurityContext | object | `{}` | The Pod Security Context |
| leaderboardApi.replicaCount | int | `1` | The number of replicas |
| leaderboardApi.resources | object | `{}` | Resource limitations for the pods |
| leaderboardApi.securityContext | object | `{}` | The Security Context |
| leaderboardApi.service.port | int | `5000` | The port of the service |
| leaderboardApi.service.type | string | `"ClusterIP"` | The type of service to create |
| leaderboardApi.swaggerUrl | string | `"localhost:5000"` | Swagger host URL |
| leaderboardApi.tolerations | list | `[]` | Tolerations |
| leaderboardGraphql.affinity | object | `{}` | Affinity rules |
| leaderboardGraphql.db.host | string | `""` | Database host. Defaults to `delegationProgramDB.host` |
| leaderboardGraphql.db.name | string | `""` | Database name. Defaults to `delegationProgramDB.name` |
| leaderboardGraphql.db.password | string | `""` | Database password, required when enabled; stored in a Secret |
| leaderboardGraphql.db.port | string | `""` | Database port. Defaults to `delegationProgramDB.port` |
| leaderboardGraphql.db.sslmode | string | `"prefer"` | libpq sslmode |
| leaderboardGraphql.db.user | string | `""` | Database user, required when enabled. Use the read-only role (e.g. `o1labs-ro`); stored in a Secret |
| leaderboardGraphql.enabled | bool | `false` | Whether to deploy uptime-graphql |
| leaderboardGraphql.extraEnvVars | list | `[]` | Extra Environment Variables, e.g. IS_UP_WINDOW_MINUTES, MAX_PAGE_SIZE, MAX_QUERY_DEPTH, STATEMENT_TIMEOUT_MS, DB_POOL_MAX_SIZE, MAX_ACTIVITY_DAYS, MAX_ACTIVITY_BUCKETS, MAX_REQUEST_BUCKETS |
| leaderboardGraphql.image.pullPolicy | string | `"IfNotPresent"` | The pullPolicy used when pulling the image |
| leaderboardGraphql.image.repository | string | `"ghcr.io/o1-labs/uptime-graphql"` | The repository of the image |
| leaderboardGraphql.image.tag | string | `""` | The tag of the image, required when enabled (`main-<sha>` or `vX.Y.Z`) |
| leaderboardGraphql.imagePullSecrets | list | `[]` | The secrets used to pull the image |
| leaderboardGraphql.ingress.annotations | object | `{}` | The Ingress Annotations, e.g. nginx.ingress.kubernetes.io/auth-url and auth-signin for oauth2-proxy |
| leaderboardGraphql.ingress.className | string | `""` | The Ingress Class Name to use |
| leaderboardGraphql.ingress.enabled | bool | `false` | Whether to create the GraphQL Ingress |
| leaderboardGraphql.ingress.hosts | list | `[]` | A list of DNS names for the GraphQL API |
| leaderboardGraphql.ingress.tls | list | `[]` | The TLS configuration |
| leaderboardGraphql.lifecycle | object | `{"preStop":{"exec":{"command":["sh","-c","sleep 10"]}}}` | Lifecycle hooks: give the endpoints time to drop the pod before uvicorn gets SIGTERM |
| leaderboardGraphql.livenessProbe | object | `{"httpGet":{"path":"/healthz","port":"http"},"periodSeconds":10}` | Liveness probe: the process runs; does not touch the database |
| leaderboardGraphql.nodeSelector | object | `{}` | Node selector labels |
| leaderboardGraphql.podAnnotations | object | `{}` | Annotations to add to the pods |
| leaderboardGraphql.podSecurityContext | object | `{"runAsNonRoot":true,"runAsUser":10001}` | The Pod Security Context. The image's USER is the name `app` (uid 10001); runAsNonRoot needs the numeric uid, or the kubelet cannot verify it and refuses to start the container |
| leaderboardGraphql.readinessProbe | object | `{"failureThreshold":3,"httpGet":{"path":"/readyz","port":"http"},"periodSeconds":10,"timeoutSeconds":6}` | Readiness probe: `SELECT 1` on the database. The service may wait up to 5 s for a pool connection, so keep timeoutSeconds above 5 |
| leaderboardGraphql.replicaCount | int | `1` | The number of replicas |
| leaderboardGraphql.resources | object | `{}` | Resource limitations for the pods |
| leaderboardGraphql.securityContext | object | `{"allowPrivilegeEscalation":false,"capabilities":{"drop":["ALL"]}}` | The Security Context |
| leaderboardGraphql.service.port | int | `8080` | The port of the service (the container listens on 8080) |
| leaderboardGraphql.service.type | string | `"ClusterIP"` | The type of service to create |
| leaderboardGraphql.tolerations | list | `[]` | Tolerations |
| leaderboardWeb | object | `{"affinity":{},"autoscaling":{"enabled":false,"maxReplicas":100,"minReplicas":1,"targetCPUUtilizationPercentage":80},"extraEnvVars":{},"image":{"pullPolicy":"IfNotPresent","repository":"673156464838.dkr.ecr.us-west-2.amazonaws.com/delegation-program-leaderboard","tag":"2.1.0"},"imagePullSecrets":[],"lifecycle":{"preStop":{"exec":{"command":["sh","-c","sleep 15 && kill -SIGQUIT 1"]}}},"nodeSelector":{},"podAnnotations":{},"podSecurityContext":{},"replicaCount":1,"resources":{},"securityContext":{},"service":{"port":80,"type":"ClusterIP"},"tolerations":[]}` | configuration options for leaderboard web deployment |
| leaderboardWeb.affinity | object | `{}` | Affinity rules |
| leaderboardWeb.autoscaling.enabled | bool | `false` | Whether to enable autoscaling |
| leaderboardWeb.autoscaling.maxReplicas | int | `100` | The maximum number of pods |
| leaderboardWeb.autoscaling.minReplicas | int | `1` | The minimum number of pods |
| leaderboardWeb.autoscaling.targetCPUUtilizationPercentage | int | `80` | The metrics to use for autoscaling |
| leaderboardWeb.extraEnvVars | object | `{}` | Extra Environment Variables |
| leaderboardWeb.image.pullPolicy | string | `"IfNotPresent"` | The pullPolicy used when pulling the image |
| leaderboardWeb.image.repository | string | `"673156464838.dkr.ecr.us-west-2.amazonaws.com/delegation-program-leaderboard"` | The repository of the image |
| leaderboardWeb.image.tag | string | `"2.1.0"` | The tag of the image. Overrides the image tag whose default is the chart appVersion. |
| leaderboardWeb.imagePullSecrets | list | `[]` | The secrets used to pull the image |
| leaderboardWeb.lifecycle | object | `{"preStop":{"exec":{"command":["sh","-c","sleep 15 && kill -SIGQUIT 1"]}}}` | Lifecycle hooks |
| leaderboardWeb.nodeSelector | object | `{}` | Node selector labels |
| leaderboardWeb.podAnnotations | object | `{}` | Annotations to add to the pods |
| leaderboardWeb.podSecurityContext | object | `{}` | The Pod Security Context |
| leaderboardWeb.replicaCount | int | `1` | The number of replicas |
| leaderboardWeb.resources | object | `{}` | Resource limitations for the pods |
| leaderboardWeb.securityContext | object | `{}` | The Security Context |
| leaderboardWeb.service.port | int | `80` | The port of the service |
| leaderboardWeb.service.type | string | `"ClusterIP"` | The type of service to create |
| leaderboardWeb.tolerations | list | `[]` | Tolerations |
| nameOverride | string | `""` | The release name override |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| serviceAccount.create | bool | `true` | Specifies whether a service account should be created |
| serviceAccount.name | string | `""` | The name of the service account to use. |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
