# MP4 to HLS Streaming Pipeline

## Overview

This project converts an MP4 video into HTTP Live Streaming (HLS) format using FFmpeg and serves it through an NGINX server.

## Features

- MP4 to HLS conversion
- HLS (.m3u8) playlist generation
- Multi-resolution streaming (360p, 720p, 1080p)
- NGINX server integration
- Batch automation using convert.bat
- Pipeline logging

## Folder Structure

```text
mp4-to-hls-streaming
│
├── input/
├── output/
│   ├── 360p/
│   ├── 720p/
│   └── 1080p/
├── logs/
├── nginx/
├── scripts/
│   └── convert.bat
├── README.md
└── .gitignore
```

## Requirements

- FFmpeg
- NGINX
- Git
- Windows 10/11

## Usage

1. Place your MP4 file in the `input` folder.
2. Run `scripts/convert.bat`.
3. Start NGINX.
4. Open the following URL in your browser or HLS player:

```
http://localhost:8080/hls/master.m3u8
```

## Author

**Vikash Kushwaha**