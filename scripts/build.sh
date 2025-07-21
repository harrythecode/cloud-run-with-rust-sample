#!/bin/bash
echo "📦 Building container with Cloud Buildpacks"
IMAGE_NAME="cloud-run-with-rust-sample"
if docker images | grep -q $IMAGE_NAME; then
    echo "🗑️  Removing existing image..."
    docker rmi $IMAGE_NAME
fi
echo "🔨 Building with Cloud Buildpacks..."
pack build $IMAGE_NAME \
    --builder gcr.io/buildpacks/builder:latest \
    --buildpack docker.io/paketocommunity/rust
echo "✅ Build complete: $IMAGE_NAME"
echo "🚀 Run: docker run -d -p 8080:8080 $IMAGE_NAME" 