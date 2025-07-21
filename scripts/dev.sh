#!/bin/bash
echo "🚀 Rust Cloud Run Sample - Local Development"
echo "📦 Installing dependencies..."
cargo build
echo "🌐 Starting server..."
echo "   Access at http://localhost:8080"
cargo run 