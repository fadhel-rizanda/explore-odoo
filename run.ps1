param (
    [Parameter(Position=0)]
    [string]$Command = "help"
)

$PODMAN = "podman"
$CONTAINER_ODOO = "odoo"
$CONTAINER_DB = "odoo-postgres"

switch ($Command.ToLower()) {
    "up" {
        & $PODMAN compose up -d
    }
    "down" {
        & $PODMAN compose down
    }
    "restart" {
        & $PODMAN compose restart
    }
    "logs" {
        & $PODMAN logs -f $CONTAINER_ODOO
    }
    "logs-db" {
        & $PODMAN logs -f $CONTAINER_DB
    }
    "shell" {
        & $PODMAN exec -it $CONTAINER_ODOO /bin/bash
    }
    "start" {
        & $PODMAN start $CONTAINER_ODOO $CONTAINER_DB
    }
    "stop" {
        & $PODMAN stop $CONTAINER_ODOO $CONTAINER_DB
    }
    "ps" {
        & $PODMAN ps
    }
    default {
        Write-Host "Usage: .\run.ps1 <command>" -ForegroundColor Cyan
        Write-Host "Commands:"
        Write-Host "  up        - Start Odoo and PostgreSQL containers"
        Write-Host "  down      - Stop and remove containers"
        Write-Host "  restart   - Restart containers"
        Write-Host "  logs      - Follow Odoo logs"
        Write-Host "  logs-db   - Follow PostgreSQL logs"
        Write-Host "  shell     - Open interactive bash inside Odoo"
        Write-Host "  start     - Start existing containers"
        Write-Host "  stop      - Stop containers"
        Write-Host "  ps        - List running containers"
    }
}
