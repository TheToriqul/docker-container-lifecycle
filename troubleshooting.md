# Docker Container Lifecycle - Troubleshooting Guide

## Common Issues and Solutions

### 1. Container Creation Issues

#### Container Fails to Start
```bash
# Check container logs
docker logs <container_id>

# Inspect container details
docker inspect <container_id>

# Verify resource availability
docker system df
```

**Common Solutions:**
- Verify image existence
- Check resource availability
- Validate configuration
- Review error logs

#### Permission Issues
```bash
# Check container user
docker inspect --format '{{.Config.User}}' <container_id>

# Verify file permissions
ls -l /path/to/volume

# Adjust permissions if needed
chmod -R 755 /path/to/volume
```

### 2. Network Issues

#### Container Network Connectivity
```bash
# Check network configuration
docker network ls
docker network inspect <network_name>

# Test container connectivity
docker exec <container_id> ping <target>

# Verify port mappings
docker port <container_id>
```

**Troubleshooting Steps:**
1. Verify network existence
2. Check network configuration
3. Test network connectivity
4. Validate port mappings

#### DNS Resolution Problems
```bash
# Check DNS configuration
docker exec <container_id> cat /etc/resolv.conf

# Test DNS resolution
docker exec <container_id> nslookup <domain>
```

### 3. Storage Issues

#### Volume Mount Problems
```bash
# List volumes
docker volume ls

# Inspect volume
docker volume inspect <volume_name>

# Check mount points
docker inspect -f '{{ .Mounts }}' <container_id>
```

**Resolution Steps:**
1. Verify volume existence
2. Check mount permissions
3. Validate paths
4. Review storage driver

#### Disk Space Issues
```bash
# Check disk usage
docker system df

# Clean up system
docker system prune

# Remove unused volumes
docker volume prune
```

### 4. Resource Issues

#### Memory Problems
```bash
# Check memory usage
docker stats <container_id>

# Inspect memory limits
docker inspect -f '{{.HostConfig.Memory}}' <container_id>
```

**Solutions:**
- Adjust memory limits
- Monitor usage patterns
- Implement cleanup
- Optimize applications

#### CPU Issues
```bash
# Monitor CPU usage
docker stats --format "table {{.Container}}\t{{.CPUPerc}}"

# Check CPU limits
docker inspect -f '{{.HostConfig.NanoCpus}}' <container_id>
```

### 5. State Management Issues

#### Container Stuck in States
```bash
# Force stop container
docker kill <container_id>

# Remove stuck container
docker rm -f <container_id>

# Check container status
docker inspect -f '{{.State.Status}}' <container_id>
```

**Recovery Steps:**
1. Force stop container
2. Remove if necessary
3. Verify host resources
4. Check logs for issues

### 6. Logging and Monitoring

#### Log Access Issues
```bash
# Check logging driver
docker inspect -f '{{.HostConfig.LogConfig.Type}}' <container_id>

# View log configuration
docker inspect -f '{{.HostConfig.LogConfig}}' <container_id>
```

#### Monitoring Problems
```bash
# Check container events
docker events

# Monitor resource usage
docker stats
```

## Diagnostic Commands

### System Information
```bash
# System overview
docker info

# Version information
docker version

# System resources
docker system df
```

### Container Diagnostics
```bash
# Container processes
docker top <container_id>

# Resource usage
docker stats <container_id>

# Container logs
docker logs --tail 100 <container_id>
```

### Network Diagnostics
```bash
# Network list
docker network ls

# Network inspection
docker network inspect <network_name>

# Container networking
docker inspect -f '{{.NetworkSettings}}' <container_id>
```

## Recovery Procedures

### 1. Container Recovery
```bash
# Backup container data
docker cp <container_id>:/data /backup

# Create new container
docker run --volumes-from <old_container> <image>
```

### 2. Network Recovery
```bash
# Recreate network
docker network create --driver bridge <network_name>

# Reconnect containers
docker network connect <network_name> <container_id>
```

### 3. Volume Recovery
```bash
# Backup volume data
docker run --rm -v <volume_name>:/data -v /backup:/backup alpine cp -r /data /backup

# Restore volume data
docker run --rm -v <volume_name>:/data -v /backup:/backup alpine cp -r /backup /data
```