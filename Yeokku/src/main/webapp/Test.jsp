<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    
    <style>
        #canvas {
            border: 1px solid #EEE;
        }
        .options {
            display: flex;
            align-items: center;
        }
    </style>
    
</head>
<body>
    <canvas id="canvas" width="800" height="400"></canvas>
    <div class="options">
        <select id="type">
            <option value="stroke">실선</option>
            <option value="square">사각형</option>
            <option value="eraser">지우개</option>
        </select>
        <select id="strokeStyle">
            <option value="blue">파란색</option>
            <option value="red">빨간색</option>
            <option value="pink">분홍색</option>
            <option value="orange">주황색</option>
        </select>
        <select id="lineWidth">
            <option value="5">5px</option>
            <option value="10">10px</option>
            <option value="15">15px</option>
            <option value="20">20px</option>
        </select>
    </div>
    <script>
        let isAbleDraw = false;
        const options = {
            type: 'stroke',
            strokeStyle: 'blue',
            lineWidth: 5,
        };
        const rects = [];
        let currentRect = null;
        document.getElementById('canvas').addEventListener('mousedown', () => {
            isAbleDraw = true;
            currentRect = {
                type: options.type,
                strokeStyle: options.strokeStyle,
                lineWidth: options.lineWidth,
                coordinates: [],
            };
        });
        document.getElementById('canvas').addEventListener('mousemove', (e) => {
            if (isAbleDraw) {
                const ctx = e.target.getContext('2d');
                const [x, y] = [e.offsetX, e.offsetY];
                currentRect.coordinates.push([x, y]);
                drawTools.clear();
                drawTools.execute(rects);
                if (currentRect.type === 'stroke') drawTools.stroke(currentRect.coordinates, 'rgba(255, 255, 0, .3)', currentRect.lineWidth);
                if (currentRect.type === 'eraser') drawTools.eraser(currentRect.coordinates, currentRect.lineWidth);
                if (currentRect.type === 'square') drawTools.square(currentRect.coordinates, 'rgba(255, 255, 0, .3)');
            }
        });
        document.getElementById('canvas').addEventListener('mouseup', () => {
            isAbleDraw = false;
            rects.push(currentRect);
            drawTools.clear();
            currentRect = null;
            drawTools.execute(rects);
            console.log(rects);
        })

        const drawTools = {
            clear() {
            	// 캔버스 내용 제거
                const canvas = document.getElementById('canvas');
                const ctx = canvas.getContext('2d');
                ctx.clearRect(0, 0, canvas.width, canvas.height);
            },
            stroke(coordinates, color, lineWidth) {
            	// 마우스가 이동한 경로를 따라 실선 그리기
                if (coordinates.length > 0) {
                    const ctx = document.getElementById('canvas').getContext('2d');
                    const firstCoordinate = coordinates[0];
                    ctx.beginPath();
                    ctx.moveTo(firstCoordinate[0], firstCoordinate[1]);
                    for (let i = 1; i < coordinates.length; i += 1) {
                        ctx.lineTo(coordinates[i][0], coordinates[i][1]);
                    }
                    ctx.strokeStyle = color;
                    ctx.lineWidth = lineWidth;
                    ctx.stroke();
                    ctx.closePath();
                }
            },
            eraser(coordinates, lineWidth) {
            	// 마우스가 이동한 좌표에 따라 하얀색으로 원을 그려서 지우개 기능처럼 동작
                const canvas = document.getElementById('canvas');
                const ctx = canvas.getContext('2d');
                for (let i = 0; i < coordinates.length; i += 1) {
                    ctx.beginPath();
                    const coordinate = coordinates[i];
                    const [x, y] = coordinate;
                    ctx.fillStyle = 'white';
                    ctx.arc(x, y, lineWidth / 2, 0, Math.PI * 2);
                    ctx.fill();
                    ctx.closePath();
                }
            },
            execute(rects) {
            	// rects 배열에 저장 된 도형을 기준으로 다시 캔버스에 그림
                for (let i = 0; i < rects.length;  i += 1) {
                    const rect = rects[i];
                    const { type } = rect;
                    if (type === 'stroke') this.stroke(rect.coordinates, rect.strokeStyle, rect.lineWidth);
                    if (type === 'eraser') this.eraser(rect.coordinates, rect.lineWidth);
                    if (type === 'square') this.square(rect.coordinates, rect.strokeStyle);
                }
            },
            square(coordinates, color) {
            	// 사각 도형을 그림
                const canvas = document.getElementById('canvas');
                const ctx = canvas.getContext('2d');
                const start = coordinates[0];
                const end = coordinates[coordinates.length - 1];
                const [startX, startY] = start;
                const [endX, endY] = [end[0] - startX, end[1] - startY];
                ctx.beginPath();
                ctx.fillStyle = color;
                ctx.fillRect(startX, startY, endX, endY);
                ctx.closePath();
            },
        };
        document.getElementById('type').addEventListener('change', (e) => {
            options.type = e.target.value;
        });
        document.getElementById('strokeStyle').addEventListener('change', (e) => {
            options.strokeStyle = e.target.value;
        });
        document.getElementById('lineWidth').addEventListener('change', (e) => {
            options.lineWidth = e.target.value;
        });
    </script>
</body>
</html>