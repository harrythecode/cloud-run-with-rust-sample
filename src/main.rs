use std::env;
use axum::{routing::get, Router};

async fn hello() -> &'static str {
    "Hello from Rust Cloud Run!"
}

async fn health() -> &'static str {
    "OK"
}

#[tokio::main]
async fn main() {
    let port = env::var("PORT").unwrap_or_else(|_| "8080".to_string());
    let addr = format!("0.0.0.0:{}", port);
    
    println!("🚀 Server starting on {}", addr);
    
    let app = Router::new()
        .route("/", get(hello))
        .route("/health", get(health));
    
    let listener = tokio::net::TcpListener::bind(&addr).await.unwrap();
    println!("✅ Server ready!");
    axum::serve(listener, app).await.unwrap();
}
