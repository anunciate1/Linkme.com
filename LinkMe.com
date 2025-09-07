<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Perfil de Javier - ¡Aventura sobre Ruedas!</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" integrity="sha512-Fo3rlrZj/k7ujTnHg4CGR2D7kSs0v4LLanw2qksYuRlEzO+tcaEPQogQ0KaoGN26/zrn20ImR1DfuLWnOo7aBA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
        /* --- Variables CSS para colores neón --- */
        :root {
            --neon-cyan: #00fffb;
            --neon-magenta: #ff00c8;
            --neon-yellow: #fcff00;
            --neon-blue: #007bff;
            --neon-green: #00ff00;
            --neon-red: #ff0000;
        }

        /* --- Base Styles --- */
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            overflow-x: hidden;
            scroll-behavior: smooth;
            background: linear-gradient(135deg, #1a1a2e, #16213e, #0f3460);
            color: #e0e0e0;
            transition: background-color 0.5s ease, color 0.5s ease;
        }

        /* Dark Mode Defaults */
        body.dark-mode {
            background: linear-gradient(135deg, #1a1a2e, #16213e, #0f3460);
            color: #e0e0e0;
        }

        body.light-mode {
            background: linear-gradient(135deg, #e0e0e0, #f0f0f0, #ffffff);
            color: #333;
        }

        .ad-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
            box-sizing: border-box;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.5);
            border-radius: 15px;
            position: relative;
            z-index: 1;
            background-color: rgba(0, 0, 0, 0.7);
            border: 2px solid var(--neon-cyan);
            transition: background-color 0.5s ease, box-shadow 0.5s ease, border-color 0.5s ease;
        }

        body.light-mode .ad-container {
            background-color: rgba(255, 255, 255, 0.9);
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
            border: 2px solid var(--neon-magenta);
        }

        /* --- Neon Text Styles con parpadeo y cambio de color aleatorio --- */
        .neon-text-small,
        .neon-text-sidebar,
        .ad-cta,
        .tiktok-username {
            font-weight: bold;
            text-align: center;
            padding: 10px 0;
            text-shadow: 0 0 5px var(--neon-cyan), 0 0 10px var(--neon-cyan), 0 0 15px var(--neon-cyan);
            animation: flicker 1.5s infinite alternate, neon-color-change 8s infinite ease-in-out;
            transition: color 0.5s ease, text-shadow 0.5s ease, border-color 0.5s ease;
        }

        .neon-text-small {
            font-size: 1.8em;
            margin-bottom: 25px;
            border-bottom: 2px solid rgba(0, 255, 251, 0.3);
        }

        .neon-text-sidebar {
            font-size: 2em;
            padding-bottom: 15px;
            margin-bottom: 20px;
            border-bottom: 1px solid rgba(0, 255, 251, 0.3);
        }

        .ad-cta {
            font-size: 1.3em;
            margin-bottom: 50px;
            padding-bottom: 20px;
            border-bottom: 2px solid rgba(0, 255, 251, 0.3);
        }

        .tiktok-username {
            font-size: 2.5em;
            margin: 10px 0 0;
        }

        /* Colores en Light Mode */
        body.light-mode .neon-text-small,
        body.light-mode .neon-text-sidebar,
        body.light-mode .ad-cta,
        body.light-mode .tiktok-username {
            text-shadow: 0 0 5px var(--neon-magenta), 0 0 10px var(--neon-magenta), 0 0 15px rgba(255, 0, 200, 0.5);
        }

        body.light-mode .neon-text-small,
        body.light-mode .ad-cta {
            border-bottom: 2px solid rgba(255, 0, 200, 0.3);
        }

        body.light-mode .neon-text-sidebar {
            border-bottom: 1px solid rgba(255, 0, 200, 0.3);
        }

        /* Neon Link Text in Menu (no parpadea, solo hover y color base) */
        .neon-text-link {
            color: #e0e0e0;
            transition: color 0.5s ease;
        }
        .menu-options a:hover .neon-text-link {
            color: var(--neon-cyan);
        }
        body.light-mode .neon-text-link {
            color: #333;
        }
        body.light-mode .menu-options a:hover .neon-text-link {
            color: var(--neon-magenta);
        }

        /* Keyframes para parpadeo */
        @keyframes flicker {
            0%, 19%, 21%, 23%, 25%, 54%, 56%, 100% {
                opacity: 1;
                text-shadow: 0 0 5px var(--current-neon-color, var(--neon-cyan)), 0 0 10px var(--current-neon-color, var(--neon-cyan)), 0 0 15px var(--current-neon-color, var(--neon-cyan));
            }
            20%, 24%, 55% {
                opacity: 0.8;
                text-shadow: none;
            }
        }

        /* Keyframes para cambio de color aleatorio (CSS Variables) */
        @keyframes neon-color-change {
            0% { --current-neon-color: var(--neon-cyan); }
            16% { --current-neon-color: var(--neon-magenta); }
            33% { --current-neon-color: var(--neon-yellow); }
            50% { --current-neon-color: var(--neon-blue); }
            66% { --current-neon-color: var(--neon-green); }
            83% { --current-neon-color: var(--neon-red); }
            100% { --current-neon-color: var(--neon-cyan); }
        }

        /* --- Hamburger Menu --- */
        .hamburger-menu {
            position: fixed;
            top: 20px;
            left: 20px;
            background-color: var(--neon-cyan);
            color: #000;
            border: none;
            border-radius: 50%;
            width: 50px;
            height: 50px;
            font-size: 1.8em;
            cursor: pointer;
            display: flex;
            justify-content: center;
            align-items: center;
            box-shadow: 0 0 15px rgba(0, 255, 251, 0.7);
            transition: all 0.3s ease;
            z-index: 1000;
        }

        .hamburger-menu:hover {
            background-color: var(--neon-cyan);
            box-shadow: 0 0 20px var(--neon-cyan);
            transform: scale(1.05);
        }

        body.light-mode .hamburger-menu {
            background-color: var(--neon-magenta);
            box-shadow: 0 0 15px rgba(255, 0, 200, 0.7);
        }

        body.light-mode .hamburger-menu:hover {
            background-color: var(--neon-magenta);
            box-shadow: 0 0 20px var(--neon-magenta);
        }

        .menu-overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.85);
            z-index: 999;
            display: flex;
            justify-content: flex-start;
            align-items: flex-start;
            opacity: 0;
            visibility: hidden;
            transition: opacity 0.3s ease, visibility 0.3s ease;
        }

        body.light-mode .menu-overlay {
            background-color: rgba(255, 255, 255, 0.85);
        }

        .menu-overlay.open {
            opacity: 1;
            visibility: visible;
        }

        .menu-sidebar {
            padding: 40px 30px;
            height: 100%;
            width: 300px;
            transform: translateX(-100%);
            transition: transform 0.3s ease-out, background-color 0.5s ease, box-shadow 0.5s ease;
            position: relative;
            display: flex;
            flex-direction: column;
            overflow-y: auto;
        }

        body.dark-mode .menu-sidebar {
            background-color: #1e1e2f;
            box-shadow: 5px 0 15px rgba(0, 0, 0, 0.6);
        }

        body.light-mode .menu-sidebar {
            background-color: #f0f0f0;
            box-shadow: 5px 0 15px rgba(0, 0, 0, 0.3);
        }

        .menu-overlay.open .menu-sidebar {
            transform: translateX(0);
        }

        .close-btn {
            position: absolute;
            top: 15px;
            right: 15px;
            background: none;
            border: none;
            font-size: 2.5em;
            color: var(--neon-magenta);
            cursor: pointer;
            line-height: 1;
            text-shadow: 0 0 8px var(--neon-magenta);
            transition: color 0.2s ease, text-shadow 0.2s ease;
        }

        .close-btn:hover {
            color: var(--neon-yellow);
            text-shadow: 0 0 10px var(--neon-yellow);
        }

        .menu-options {
            list-style: none;
            padding: 0;
            margin: 0;
            flex-grow: 1;
        }

        .menu-options li {
            margin-bottom: 15px;
        }

        .menu-options a {
            text-decoration: none;
            font-size: 1.1em;
            display: block;
            padding: 10px 15px;
            border-radius: 8px;
            transition: background-color 0.2s ease, transform 0.2s ease;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        body.dark-mode .menu-options a {
            color: #e0e0e0;
        }
        body.dark-mode .menu-options a:hover {
            background-color: rgba(0, 255, 251, 0.2);
            color: var(--neon-cyan);
            transform: translateX(5px);
        }
        body.light-mode .menu-options a {
            color: #333;
        }
        body.light-mode .menu-options a:hover {
            background-color: rgba(255, 0, 200, 0.2);
            color: var(--neon-magenta);
            transform: translateX(5px);
        }

        body.dark-mode .menu-options a i {
            color: var(--neon-magenta);
        }
        body.dark-mode .menu-options a:hover i {
            color: var(--neon-cyan);
        }

        body.light-mode .menu-options a i {
            color: var(--neon-cyan);
        }
        body.light-mode .menu-options a:hover i {
            color: var(--neon-magenta);
        }

        .random-info-box {
            border-radius: 10px;
            padding: 15px;
            margin-top: 20px;
            font-size: 0.9em;
            line-height: 1.6;
            display: none;
            animation: fadeIn 0.5s ease-out forwards;
            transition: background-color 0.5s ease, border-color 0.5s ease, color 0.5s ease;
        }

        body.dark-mode .random-info-box {
            background-color: rgba(255, 255, 255, 0.08);
            color: #e0e0e0;
            border: 1px solid rgba(255, 255, 255, 0.1);
        }
        body.light-mode .random-info-box {
            background-color: rgba(0, 0, 0, 0.08);
            color: #333;
            border: 1px solid rgba(0, 0, 0, 0.1);
        }

        .random-info-box p strong {
            color: var(--neon-yellow);
        }

        .random-info-box a {
            text-decoration: none;
            transition: color 0.5s ease;
        }

        body.dark-mode .random-info-box a {
            color: var(--neon-cyan);
        }
        body.dark-mode .random-info-box a:hover {
            text-decoration: underline;
        }

        body.light-mode .random-info-box a {
            color: var(--neon-magenta);
        }
        body.light-mode .random-info-box a:hover {
            text-decoration: underline;
        }

        /* --- Header y Perfil de TikTok --- */
        .ad-header {
            text-align: center;
            padding: 40px 20px;
            background-color: #000;
            border-radius: 10px;
            margin-bottom: 30px;
            position: relative;
            overflow: hidden;
            border: 2px solid var(--neon-cyan);
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.7);
            transition: background-color 0.5s ease, border-color 0.5s ease, box-shadow 0.5s ease;
        }

        body.light-mode .ad-header {
            background-color: #fff;
            border: 2px solid var(--neon-magenta);
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
        }

        .tiktok-profile-header {
            position: relative;
            z-index: 1;
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 15px;
        }

        .profile-pic-container {
            position: relative;
            width: 150px;
            height: 150px;
            border-radius: 50%;
            overflow: hidden;
            border: 5px solid var(--neon-magenta);
            box-shadow: 0 0 15px var(--neon-magenta), 0 0 30px rgba(255, 0, 200, 0.5);
            transition: transform 0.3s ease, border-color 0.5s ease, box-shadow 0.5s ease;
        }

        body.light-mode .profile-pic-container {
            border-color: var(--neon-cyan);
            box-shadow: 0 0 15px var(--neon-cyan), 0 0 30px rgba(0, 255, 251, 0.5);
        }

        .profile-pic {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .tiktok-bio {
            max-width: 600px;
            font-size: 1.1em;
            line-height: 1.6;
            margin-bottom: 25px;
            color: #ccc;
            transition: color 0.5s ease;
        }

        body.light-mode .tiktok-bio {
            color: #444;
        }

        .tiktok-follow-btn {
            display: inline-block;
            background-color: var(--neon-magenta);
            color: #fff;
            padding: 12px 30px;
            border-radius: 30px;
            text-decoration: none;
            font-weight: bold;
            font-size: 1.1em;
            transition: background-color 0.3s ease, transform 0.2s ease, box-shadow 0.3s ease;
            box-shadow: 0 0 10px rgba(255, 0, 200, 0.5);
            margin-bottom: 30px;
        }

        .tiktok-follow-btn:hover {
            background-color: var(--neon-yellow);
            color: #000;
            transform: translateY(-3px);
            box-shadow: 0 0 15px rgba(252, 255, 0, 0.8);
        }

        /* --- Social Buttons --- */
        .ad-description {
            text-align: center;
            font-size: 1.1em;
            margin-bottom: 25px;
            transition: color 0.5s ease;
        }

        body.light-mode .ad-description {
            color: #333;
        }

        .social-buttons {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
            margin-bottom: 40px;
        }

        .social-btn {
            display: flex;
            align-items: center;
            gap: 10px;
            padding: 12px 25px;
            border-radius: 30px;
            text-decoration: none;
            font-weight: bold;
            font-size: 1.1em;
            transition: transform 0.2s ease, box-shadow 0.3s ease;
            border: none;
            cursor: pointer;
            position: relative;
            overflow: hidden;
        }

        .social-btn .button-arrow {
            margin-left: auto;
            font-size: 1em;
            color: inherit;
        }

        .social-btn i {
            font-size: 1.3em;
        }

        .social-btn span {
            position: relative;
            z-index: 1;
        }

        .social-btn::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: 0;
            opacity: 0;
            transition: opacity 0.3s ease;
        }

        .social-btn:hover {
            transform: translateY(-3px);
        }

        .social-btn.facebook {
            background: linear-gradient(45deg, #3b5998, #6c8dbf);
            color: #fff;
            box-shadow: 0 0 10px rgba(59, 89, 152, 0.5);
        }
        .social-btn.facebook:hover {
            box-shadow: 0 0 15px rgba(59, 89, 152, 0.8);
        }

        .social-btn.tiktok-secondary {
            background: linear-gradient(45deg, var(--neon-yellow), var(--neon-magenta));
            color: #000;
            box-shadow: 0 0 10px rgba(255, 0, 200, 0.5);
        }
        .social-btn.tiktok-secondary:hover {
            box-shadow: 0 0 15px rgba(252, 255, 0, 0.8);
        }

        .social-btn.instagram {
            background: linear-gradient(45deg, #f09433, #e6683c, #dc2743, #cc2366, #bc1888);
            color: #fff;
            box-shadow: 0 0 10px rgba(220, 40, 67, 0.5);
        }
        .social-btn.instagram:hover {
            box-shadow: 0 0 15px rgba(220, 40, 67, 0.8);
        }

        .social-btn.youtube {
            background-color: #ff0000;
            color: #fff;
            box-shadow: 0 0 10px rgba(255, 0, 0, 0.5);
        }
        .social-btn.youtube:hover {
            box-shadow: 0 0 15px rgba(255, 0, 0, 0.8);
        }

        /* --- Sección de Mis Aventuras --- */
        .my-adventures-section {
            margin-top: 50px;
            padding: 30px 20px;
            border-radius: 15px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.5);
            text-align: center;
            background-color: rgba(255, 255, 255, 0.05);
            border: 1px solid var(--neon-cyan);
            transition: background-color 0.5s ease, border-color 0.5s ease, box-shadow 0.5s ease;
        }

        body.light-mode .my-adventures-section {
            background-color: rgba(0, 0, 0, 0.05);
            border: 1px solid var(--neon-magenta);
        }

        .adventure-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            margin-top: 30px;
        }

        .adventure-item {
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
            background-color: rgba(255, 255, 255, 0.08);
            border: 1px solid rgba(255, 255, 255, 0.1);
            transition: transform 0.2s ease, box-shadow 0.2s ease, background-color 0.5s ease, border-color 0.5s ease;
        }

        body.light-mode .adventure-item {
            background-color: rgba(0, 0, 0, 0.08);
            border: 1px solid rgba(0, 0, 0, 0.1);
        }

        .adventure-item:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.5);
        }

        .adventure-pic {
            width: 100%;
            height: 180px;
            object-fit: cover;
            display: block;
        }

        .adventure-caption {
            padding: 15px;
            font-size: 1em;
            background-color: rgba(0, 0, 0, 0.6);
            border-top: 1px solid rgba(255, 255, 255, 0.1);
            color: #ccc;
            transition: background-color 0.5s ease, border-color 0.5s ease, color 0.5s ease;
        }

        body.light-mode .adventure-caption {
            background-color: rgba(255, 255, 255, 0.6);
            border-top: 1px solid rgba(0, 0, 0, 0.1);
            color: #444;
        }

        /* --- Video Section --- */
        .video-section {
            margin-bottom: 40px;
            padding: 20px 0;
            border-top: 1px solid rgba(255, 255, 255, 0.1);
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
            transition: border-color 0.5s ease;
        }

        body.light-mode .video-section {
            border-top: 1px solid rgba(0, 0, 0, 0.1);
            border-bottom: 1px solid rgba(0, 0, 0, 0.1);
        }

        .video-section-info {
            text-align: center;
            font-size: 0.9em;
            color: #999;
            margin-bottom: 20px;
            transition: color 0.5s ease;
        }

        body.light-mode .video-section-info {
            color: #666;
        }

        .video-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 25px;
            margin-top: 30px;
        }

        .video-item {
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
            transition: transform 0.2s ease, box-shadow 0.2s ease, background-color 0.5s ease, border-color 0.5s ease;
        }

        body.dark-mode .video-item {
            background-color: rgba(255, 255, 255, 0.08);
            border: 1px solid rgba(255, 255, 255, 0.1);
        }

        body.light-mode .video-item {
            background-color: rgba(0, 0, 0, 0.08);
            border: 1px solid rgba(0, 0, 0, 0.1);
        }

        .video-item:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.5);
        }

        .video-wrapper {
            position: relative;
            padding-bottom: 56.25%;
            height: 0;
            overflow: hidden;
        }

        .video-wrapper iframe {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            border: 0;
        }

        .video-caption {
            padding: 15px;
            font-size: 0.95em;
            background-color: rgba(0, 0, 0, 0.6);
            border-top: 1px solid rgba(255, 255, 255, 0.1);
            text-align: center;
            transition: background-color 0.5s ease, border-color 0.5s ease, color 0.5s ease;
        }

        body.dark-mode .video-caption {
            color: #ccc;
        }

        body.light-mode .video-caption {
            background-color: rgba(255, 255, 255, 0.6);
            border-top: 1px solid rgba(0, 0, 0, 0.1);
            color: #444;
        }

        /* --- El Rincón de Javier Section y Guía de Mecánica IA --- */
        .javier-entertainment-section {
            margin-top: 50px;
            padding: 30px 20px;
            border-radius: 15px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.5);
            text-align: center;
            background-color: rgba(255, 255, 255, 0.05);
            border: 1px solid var(--neon-cyan);
            transition: background-color 0.5s ease, border-color 0.5s ease, box-shadow 0.5s ease;
        }

        body.light-mode .javier-entertainment-section {
            background-color: rgba(0, 0, 0, 0.05);
            border: 1px solid var(--neon-magenta);
        }

        .javier-description {
            font-size: 1.1em;
            margin-bottom: 30px;
            line-height: 1.6;
            color: #ccc;
            transition: color 0.5s ease;
        }

        body.light-mode .javier-description {
            color: #444;
        }

        .entertainment-options {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 15px;
            margin-bottom: 30px;
        }

        .entertainment-btn {
            background-color: rgba(255, 0, 200, 0.2);
            color: var(--neon-magenta);
            border: 2px solid var(--neon-magenta);
            padding: 12px 25px;
            border-radius: 25px;
            text-decoration: none;
            font-weight: bold;
            font-size: 1em;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.2s ease, box-shadow 0.3s ease, color 0.3s ease, border-color 0.3s ease;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .entertainment-btn i {
            color: var(--neon-cyan);
            font-size: 1.2em;
            transition: color 0.3s ease;
        }

        .entertainment-btn:hover {
            background-color: var(--neon-magenta);
            color: #fff;
            transform: translateY(-3px);
            box-shadow: 0 0 15px rgba(255, 0, 200, 0.8);
        }

        .entertainment-btn:hover i {
            color: #fff;
        }

        body.light-mode .entertainment-btn {
            background-color: rgba(0, 255, 251, 0.2);
            color: var(--neon-cyan);
            border-color: var(--neon-cyan);
        }

        body.light-mode .entertainment-btn i {
            color: var(--neon-magenta);
        }

        body.light-mode .entertainment-btn:hover {
            background-color: var(--neon-cyan);
            color: #000;
            box-shadow: 0 0 15px rgba(0, 255, 251, 0.8);
        }

        body.light-mode .entertainment-btn:hover i {
            color: #000;
        }

        /* Quiz Styles */
        .quiz-options {
            display: flex;
            flex-direction: column;
            gap: 10px;
            margin-top: 20px;
        }

        .quiz-option-btn {
            background-color: rgba(0, 255, 251, 0.1);
            color: var(--neon-cyan);
            border: 1px solid var(--neon-cyan);
            padding: 10px 15px;
            border-radius: 8px;
            cursor: pointer;
            font-size: 0.95em;
            transition: background-color 0.2s ease, transform 0.1s ease, color 0.5s ease, border-color 0.5s ease;
        }

        .quiz-option-btn:hover:not(:disabled) {
            background-color: rgba(0, 255, 251, 0.3);
            transform: translateX(3px);
        }

        .quiz-option-btn:disabled {
            cursor: not-allowed;
            opacity: 0.7;
        }

        body.light-mode .quiz-option-btn {
            background-color: rgba(255, 0, 200, 0.1);
            color: var(--neon-magenta);
            border-color: var(--neon-magenta);
        }

        body.light-mode .quiz-option-btn:hover:not(:disabled) {
            background-color: rgba(255, 0, 200, 0.3);
        }

        #quizResult {
            font-size: 1.1em;
            margin-top: 20px;
            transition: color 0.5s ease;
        }

        /* Estilos para el contenido de la Guía de Mecánica */
        #mechanicGuideContent {
            text-align: left;
        }

        #mechanicGuideContent p {
            margin-bottom: 10px;
        }

        #mechanicGuideContent ul {
            list-style: disc;
            margin-left: 20px;
            padding-left: 0;
        }
        #mechanicGuideContent ul li {
            margin-bottom: 5px;
        }

        /* --- Footer --- */
        .ad-footer {
            text-align: center;
            padding: 20px;
            margin-top: 50px;
            border-top: 1px solid rgba(255, 255, 255, 0.1);
            font-size: 0.9em;
            color: #aaa;
            transition: border-color 0.5s ease, color 0.5s ease;
        }

        body.light-mode .ad-footer {
            color: #555;
            border-top: 1px solid rgba(0, 0, 0, 0.1);
        }

        /* Keyframe animations */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(10px); }
            to { opacity: 1; transform: translateY(0); }
        }

        /* Responsive adjustments */
        @media (max-width: 768px) {
            .ad-container {
                padding: 15px;
            }

            .neon-text-small {
                font-size: 1.5em;
            }

            .tiktok-username {
                font-size: 2em;
            }

            .video-grid, .adventure-grid {
                grid-template-columns: 1fr;
            }

            .social-buttons {
                flex-direction: column;
                align-items: center;
            }

            .entertainment-options {
                flex-direction: column;
                align-items: center;
            }

            .hamburger-menu {
                width: 45px;
                height: 45px;
                font-size: 1.5em;
                top: 15px;
                left: 15px;
            }

            .menu-sidebar {
                width: 250px;
                padding: 30px 20px;
            }
        }

        @media (max-width: 480px) {
            .tiktok-username {
                font-size: 1.8em;
            }

            .tiktok-follow-btn, .social-btn, .entertainment-btn {
                font-size: 0.9em;
                padding: 10px 20px;
            }
        }
    </style>
</head>
<body class="dark-mode">

    <div class="menu-overlay" id="menuOverlay">
        <nav class="menu-sidebar">
            <button class="close-btn" onclick="toggleMenu()">×</button>
            <h2 class="neon-text-sidebar">Opciones de Soporte</h2>
            <ul class="menu-options">
                <li><a href="javascript:void(0);" onclick="showRandomInfo('Contacto')"><span class="neon-text-link">Contacto</span> <i class="fas fa-headset"></i></a></li>
                <li><a href="javascript:void(0);" onclick="showRandomInfo('Preguntas Frecuentes')"><span class="neon-text-link">Preguntas Frecuentes</span> <i class="fas fa-question-circle"></i></a></li>
                <li><a href="javascript:void(0);" onclick="showRandomInfo('Acerca de Mi')"><span class="neon-text-link">Acerca de Mí</span> <i class="fas fa-info-circle"></i></a></li>
                <li><a href="javascript:void(0);" onclick="showRandomInfo('Colaboraciones')"><span class="neon-text-link">Colaboraciones</span> <i class="fas fa-handshake"></i></a></li>
                <li><a href="javascript:void(0);" onclick="showRandomInfo('Galería')"><span class="neon-text-link">Galería</span> <i class="fas fa-images"></i></a></li>
                <li>
                    <a href="javascript:void(0);" onclick="toggleDarkMode()">
                        <span class="neon-text-link" id="modeToggleText">Modo Oscuro</span> <i class="fas fa-moon" id="modeToggleIcon"></i>
                    </a>
                </li>
            </ul>
            <div id="randomInfoContent" class="random-info-box">
                </div>
        </nav>
    </div>

    <div class="ad-container">
        <button class="hamburger-menu" onclick="toggleMenu()">
            <i class="fas fa-bars"></i>
        </button>

        <header class="ad-header">
            <section class="tiktok-profile-header">
                <div class="profile-pic-container">
                    <img src="https://i.ibb.co/xSFMShy5/IMG-0750.jpg" alt="Foto de Perfil de Javier en TikTok" class="profile-pic">
                </div>
                <h1 class="tiktok-username">@javierortiz9695</h1>
                <p class="tiktok-bio">¡Hola! Soy **Javier**, tu compañero de aventuras sobre dos ruedas. Sigue mi viaje para más emoción y adrenalina. 🏍️💨</p>
                <a href="https://www.tiktok.com/@javierortiz9695" target="_blank" rel="noopener noreferrer" class="tiktok-follow-btn">
                    Seguir en TikTok
                </a>

                <p class="ad-description">Conéctate con **Javier** en otras plataformas para no perderte nada de la aventura:</p>
                <div class="social-buttons">
                    <a href="https://www.facebook.com/share/1DLqJFEugQ/?mibextid=wwXIfr" target="_blank" rel="noopener noreferrer" class="social-btn facebook">
                        <i class="fab fa-facebook-f"></i>
                        <span>Facebook de Javier</span>
                        <i class="fas fa-arrow-right button-arrow"></i>
                    </a>
                     <a href="https://www.tiktok.com/@javierortiz9695" target="_blank" rel="noopener noreferrer" class="social-btn tiktok-secondary">
                        <i class="fab fa-tiktok"></i>
                        <span>Ver más en TikTok</span>
                        <i class="fas fa-arrow-right button-arrow"></i>
                    </a>
                    <a href="https://www.instagram.com/javier_ortiz_19?igsh=YWtkYXExeW9xdmcy" target="_blank" rel="noopener noreferrer" class="social-btn instagram">
                        <i class="fab fa-instagram"></i>
                        <span>Instagram de Javier</span>
                        <i class="fas fa-arrow-right button-arrow"></i>
                    </a>
                     <a href="https://www.youtube.com/@elpelochino8818" target="_blank" rel="noopener noreferrer" class="social-btn youtube">
                        <i class="fab fa-youtube"></i>
                        <span>YouTube de Javier</span>
                        <i class="fas fa-arrow-right button-arrow"></i>
                    </a>
                </div>
                <p class="ad-cta neon-text-small">¡Un clic, una nueva conexión para tu viaje con Javier!</p>

                <div class="my-adventures-section">
                    <h2 class="neon-text-small">Mis Aventuras</h2>
                    <div class="adventure-grid">
                        <div class="adventure-item">
                            <img src="https://i.ibb.co/0Vjz650Y/IMG-0758.jpg" alt="Aventura 1" class="adventure-pic">
                            <p class="adventure-caption">Explorando nuevas rutas en la sierra.</p>
                        </div>
                        <div class="adventure-item">
                            <img src="https://i.ibb.co/JWnzVvnk/IMG-0757.jpg" alt="Aventura 2" class="adventure-pic">
                            <p class="adventure-caption">Despues de una aventura un break.</p>
                        </div>
                        <div class="adventure-item">
                            <img src="https://i.ibb.co/gZPpNbML/IMG-0759.jpg" alt="Aventura 3" class="adventure-pic">
                            <p class="adventure-caption">Conociendo paisajes increíbles con mi primera moto.</p>
                        </div>
                    </div>
                </div>

            </section>
        </header>

        <section class="ad-content">
            <div class="video-section">
                <h2 class="neon-text-small">Videos Destacados de Javier en YOUTUBE</h2>
                <div class="video-grid">
                    <div class="video-item">
                        <div class="video-wrapper">
                            <iframe src="https://www.youtube.com/embed/UWG1aqAsN8E" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                        </div>
                        <p class="video-caption">El Pelo Chino - con un toque de velocidad.</p>
                    </div>
                    <div class="video-item">
                        <div class="video-wrapper">
                            <iframe src="https://www.youtube.com/embed/CsYgSOMfsHU" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                        </div>
                        <p class="video-caption">Explorando el mundo con un corrido de fondo.</p>
                    </div>
                    <div class="video-item">
                        <div class="video-wrapper">
                            <iframe src="https://www.youtube.com/embed/tUD0tnan8Lc" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                        </div>
                        <p class="video-caption">¡Acelera con el ritmo de la carretera!</p>
                    </div>
                </div>
            </div>

            <section class="javier-entertainment-section" id="mechanicGuideSection">
                <h2 class="neon-text-small">Guía de Mecánica de tu Moto (con IA)</h2>
                <p class="javier-description">
                    ¡Tu asistente personal para el mantenimiento de tu MOTO y cualquier otra moto!
                    Selecciona una categoría de abajo para obtener información detallada sobre su mantenimiento, posibles problemas y soluciones.
                </p>

                <div class="entertainment-options">
                    <a href="javascript:void(0);" class="entertainment-btn" onclick="showMechanicCategory('motor')">
                        <i class="fas fa-engine"></i> Motor y Lubricación
                    </a>
                    <a href="javascript:void(0);" class="entertainment-btn" onclick="showMechanicCategory('frenos')">
                        <i class="fas fa-hand-paper"></i> Sistema de Frenos
                    </a>
                    <a href="javascript:void(0);" class="entertainment-btn" onclick="showMechanicCategory('ruedas')">
                        <i class="fas fa-tire"></i> Neumáticos y Ruedas
                    </a>
                    <a href="javascript:void(0);" class="entertainment-btn" onclick="showMechanicCategory('transmision')">
                        <i class="fas fa-cogs"></i> Transmisión (Cadena/Cardan)
                    </a>
                    <a href="javascript:void(0);" class="entertainment-btn" onclick="showMechanicCategory('electricidad')">
                        <i class="fas fa-battery-full"></i> Sistema Eléctrico y Luces
                    </a>
                    <a href="javascript:void(0);" class="entertainment-btn" onclick="showMechanicCategory('suspension')">
                        <i class="fas fa-shock-absorber"></i> Suspensión y Chasis
                    </a>
                    <a href="javascript:void(0);" class="entertainment-btn" onclick="showMechanicCategory('combustible')">
                        <i class="fas fa-gas-pump"></i> Sistema de Combustible
                    </a>
                    <a href="javascript:void(0);" class="entertainment-btn" onclick="showMechanicCategory('revisiones')">
                        <i class="fas fa-calendar-check"></i> Revisiones Generales
                    </a>
                </div>
                <div id="mechanicGuideContent" class="random-info-box">
                    <p>Haz clic en una categoría para empezar.</p>
                </div>
            </section>
        </section>

        <section class="javier-entertainment-section">
            <h2 class="neon-text-small">El Rincón de Javier - Aventura sobre Ruedas</h2>
            <p class="javier-description">
                ¡Prepárate para la velocidad y la emoción! Soy **Javier**, un apasionado de las motos, y mi compañera favorita en cada ruta es mi **DM 250 gris**. Aquí te traigo lo mejor del mundo motero y mis propias vivencias sobre dos ruedas.
            </p>

            <div class="entertainment-options">
                <a href="javascript:void(0);" class="entertainment-btn" onclick="showMotorcycleFact()">
                    <i class="fas fa-motorcycle"></i> Curiosidad Motera
                </a>
                <a href="javascript:void(0);" class="entertainment-btn" onclick="showRiderQuote()">
                    <i class="fas fa-quote-right"></i> Frase del Motero
                </a>
                <a href="javascript:void(0);" class="entertainment-btn" onclick="showMotorcycleChallenge()">
                    <i class="fas fa-trophy"></i> Reto Motero
                </a>
                <a href="javascript:void(0);" class="entertainment-btn" onclick="startRiderQuiz()">
                    <i class="fas fa-question-circle"></i> Quiz Motero
                </a>
            </div>
            <div id="entertainmentContent" class="random-info-box">
                </div>
        </section>

        <footer class="ad-footer">
            <p>© 2025 Javier. Todos los derechos reservados.</p>
        </footer>
    </div>

    <script>
        // JavaScript para el menú de hamburguesa y la información aleatoria
        function toggleMenu() {
            const menuOverlay = document.getElementById('menuOverlay');
            menuOverlay.classList.toggle('open');
        }

        function showRandomInfo(option) {
            const infoBox = document.getElementById('randomInfoContent');
            let content = '';
            let photoUrl = '';

            const randomPics = [
                'https://picsum.photos/id/237/100/100',
                'https://picsum.photos/id/23/100/100',
                'https://picsum.photos/id/66/100/100',
                'https://picsum.photos/id/90/100/100',
                'https://picsum.photos/id/100/100/100',
                'https://picsum.photos/id/101/100/100',
                'https://picsum.photos/id/102/100/100'
            ];
            const getRandomPic = () => randomPics[Math.floor(Math.random() * randomPics.length)];

            switch(option) {
                case 'Contacto':
                    content = '<p>¡Siempre listo para conectar! Puedes enviarme un correo a <a href="mailto:instagram@javier_ortiz_19">instagram@javier_ortiz_19</a> o buscarme en mis redes sociales para charlar sobre motos.</p>';
                    photoUrl = getRandomPic();
                    break;
                case 'Preguntas Frecuentes':
                    content = '<p><b>P: ¿Cuál es tu moto favorita para rutas largas?</b> R: ¡Sin duda, mi DM 250 gris, es mi compañera ideal para cada aventura!</p><p><b>P: ¿Dónde aprendiste a hacer acrobacias?</b> R: Con mucha práctica, paciencia y, por supuesto, equipo de seguridad. ¡No lo intenten en casa sin supervisión!</p>';
                    photoUrl = getRandomPic();
                    break;
                case 'Acerca de Mi':
                    content = '<p>Soy **Javier**, un apasionado de las motos, los viajes y la adrenalina. Me encanta explorar nuevas rutas y compartir la emoción de la carretera con mi comunidad. Mi moto favorita es mi fiel **DM 250 gris**.</p>';
                    photoUrl = getRandomPic();
                    break;
                case 'Colaboraciones':
                    content = '<p>¿Tienes una idea para una aventura motera o quieres patrocinar contenido? ¡Hablemos! Escríbeme a <a href="mailto:colaboraciones.colabora conmigo">instagram@javier_ortiz_19</a></p>';
                    photoUrl = getRandomPic();
                    break;
                case 'Galería':
                    content = '<p>¡Echa un vistazo a mis mejores momentos sobre dos ruedas!</p><div style="display:flex; gap: 5px; flex-wrap: wrap; justify-content: center;"><img src="https://picsum.photos/id/103/80/80" style="border-radius:5px;"><img src="https://picsum.photos/id/104/80/80" style="border-radius:5px;"><img src="https://picsum.photos/id/105/80/80" style="border-radius:5px;"></div>';
                    photoUrl = '';
                    break;
                default:
                    content = '<p>Selecciona una opción del menú para ver más información.</p>';
                    photoUrl = '';
            }

            infoBox.innerHTML = content;
            if (photoUrl && option !== 'Galería') {
                infoBox.innerHTML += `<img src="${photoUrl}" alt="Imagen aleatoria" style="max-width: 100px; margin-top: 15px; border-radius: 8px;">`;
            }
            infoBox.style.display = 'block';
        }

        // --- Funciones para "El Rincón de Javier - Aventura sobre Ruedas" ---
        const motorcycleFacts = [
            "¿Sabías que la moto más rápida del mundo es la Dodge Tomahawk, con una velocidad máxima teórica de 675 km/h?",
            "La primera motocicleta fue inventada por Gottlieb Daimler en 1885.",
            "En la India hay más motocicletas que automóviles.",
            "El mayor desfile de motos del mundo es el 'Ride for Dad' en Ottawa, Canadá, con más de 3000 motos.",
            "Los motores de Harley-Davidson tienen un sonido distintivo debido a su configuración de motor V-twin y el ángulo de 45 grados entre los cilindros."
        ];

        const riderQuotes = [
            "Cuatro ruedas mueven el cuerpo, dos ruedas mueven el alma. - Javier",
            "La vida es como una motocicleta, si no te inclinas, no giras. - Javier",
            "No es la máquina lo que te hace motero, es la carretera en tus venas. - Javier",
            "Cada viaje en moto es una historia esperando ser escrita. - Javier",
            "La libertad es el viento en tu cara, el sol en tu espalda y la carretera por delante. - Javier"
        ];

        const motorcycleChallenges = [
            "¡Intenta identificar 5 marcas de motos diferentes solo por su sonido!",
            "¿Puedes nombrar los 7 componentes principales de una motocicleta?",
            "Planifica tu ruta ideal de viaje en moto por un país que siempre hayas querido visitar.",
            "Describe tu experiencia más emocionante o aterradora sobre dos ruedas.",
            "Aprende a revisar los niveles básicos (aceite, frenos, neumáticos) de una moto."
        ];

        function showContent(arr, targetId) {
            const contentBox = document.getElementById(targetId);
            const randomIndex = Math.floor(Math.random() * arr.length);
            contentBox.innerHTML = `<p>${arr[randomIndex]}</p>`;
            contentBox.style.display = 'block';
        }

        function showMotorcycleFact() {
            showContent(motorcycleFacts, 'entertainmentContent');
        }

        function showRiderQuote() {
            showContent(riderQuotes, 'entertainmentContent');
        }

        function showMotorcycleChallenge() {
            showContent(motorcycleChallenges, 'entertainmentContent');
        }

        // Quiz Motero
        const quizQuestions = [
            {
                question: "¿Qué tipo de moto es ideal para viajar largas distancias con comodidad?",
                options: ["Deportiva", "Custom", "Touring", "Naked"],
                answer: "Touring"
            },
            {
                question: "¿Qué cilindrada se considera de 'alta' en una motocicleta?",
                options: ["250cc", "500cc", "750cc", "1000cc o más"],
                answer: "1000cc o más"
            },
            {
                question: "¿Qué elemento de seguridad es OBLIGATORIO para todo motociclista?",
                options: ["Chaqueta de cuero", "Guantes", "Casco", "Botas"],
                answer: "Casco"
            },
            {
                question: "¿Qué significa 'ABS' en el contexto de las motos?",
                options: ["Sistema de frenos automático", "Sistema de asistencia de balanceo", "Sistema de frenado antibloqueo", "Sistema de aceleración avanzado"],
                answer: "Sistema de frenado antibloqueo"
            },
            {
                question: "¿Cuál es la función principal del embrague en una motocicleta?",
                options: ["Cambiar la velocidad", "Conectar y desconectar el motor de la transmisión", "Frenar la moto", "Encender el motor"],
                answer: "Conectar y desconectar el motor de la transmisión"
            }
        ];

        function startRiderQuiz() {
            const infoBox = document.getElementById('entertainmentContent');
            let quizHtml = '<h3><i class="fas fa-question-circle"></i> ¡Pon a prueba tus conocimientos moteros!</h3>';
            const question = quizQuestions[Math.floor(Math.random() * quizQuestions.length)];

            quizHtml += `<p>${question.question}</p><div class="quiz-options">`;
            question.options.forEach((opt, index) => {
                quizHtml += `<button class="quiz-option-btn" onclick="checkAnswer('${opt}', '${question.answer}', this)">${opt}</button>`;
            });
            quizHtml += `</div><p id="quizResult" style="margin-top: 15px; font-weight: bold;"></p>`;
            infoBox.innerHTML = quizHtml;
            infoBox.style.display = 'block';
        }

        function checkAnswer(selectedAnswer, correctAnswer, buttonElement) {
            const resultElement = document.getElementById('quizResult');
            const allButtons = document.querySelectorAll('.quiz-option-btn');
            allButtons.forEach(btn => btn.disabled = true);

            if (selectedAnswer === correctAnswer) {
                resultElement.style.color = '#00ff00';
                resultElement.innerHTML = '<i class="fas fa-check-circle"></i> ¡Correcto! Eres un verdadero experto.';
                buttonElement.style.backgroundColor = '#00aa00';
            } else {
                resultElement.style.color = '#ff0000';
                resultElement.innerHTML = `<i class="fas fa-times-circle"></i> Incorrecto. La respuesta correcta era: <b>${correctAnswer}</b>.`;
                buttonElement.style.backgroundColor = '#aa0000';
                allButtons.forEach(btn => {
                    if (btn.textContent === correctAnswer) {
                        btn.style.backgroundColor = '#00aa00';
                    }
                });
            }
        }

        // Guía de Mecánica (IA Simulada) con preguntas por categoría
        const mechanicCategories = {
            motor: {
                title: "Motor y Lubricación",
                questions: [
                    {
                        q: "¿Qué periodicidad se recomienda para el cambio de aceite de motor y por qué es tan crucial?",
                        a: "El **aceite de motor** es el 'salvavidas' de tu moto. Su cambio se recomienda generalmente cada **3,000 a 5,000 kilómetros** o anualmente, lo que ocurra primero, aunque siempre debes **consultar el manual de tu DM 250 gris** para la especificación exacta. Es crucial porque lubrica las partes móviles, reduce la fricción, disipa el calor y limpia el motor, previniendo el desgaste prematuro y fallos catastróficos. Un aceite viejo pierde sus propiedades protectoras y se contamina, dañando el motor."
                    },
                    {
                        q: "¿Qué señales indican un nivel bajo de aceite o una presión de aceite insuficiente?",
                        a: "Las señales de un nivel bajo de aceite o presión insuficiente incluyen un **testigo de presión de aceite encendido** en el tablero, **ruidos metálicos inusuales** provenientes del motor (golpeteos, chirridos), **sobrecalentamiento** del motor, o una **disminución notable en el rendimiento** o la potencia. Ignorar estas señales puede causar daños graves e irreversibles al motor, como agarrotamiento de bielas o pistones."
                    },
                    {
                        q: "¿Cuál es la importancia del filtro de aceite y cuándo debe ser reemplazado?",
                        a: "El **filtro de aceite** es esencial porque retiene las impurezas, residuos metálicos y contaminantes que se generan en el motor, manteniendo el aceite limpio y prolongando la vida útil del motor. Generalmente debe ser **reemplazado en cada cambio de aceite**, o al menos cada dos cambios de aceite, dependiendo de las recomendaciones del fabricante y el tipo de filtro. Un filtro obstruido puede reducir el flujo de aceite, causando un lubricado deficiente."
                    },
                    {
                        q: "¿Qué función cumple el sistema de refrigeración y cómo se mantiene adecuadamente?",
                        a: "El **sistema de refrigeración** (si tu DM 250 cuenta con él, como es común en motos modernas) mantiene el motor a su temperatura óptima de funcionamiento, evitando el sobrecalentamiento. Se mantiene revisando regularmente el **nivel del líquido refrigerante** en el depósito de expansión (cuando el motor está frío) y asegurándose de que esté entre las marcas de mínimo y máximo. Es importante también **purgar el aire** del sistema si es necesario y **reemplazar el líquido refrigerante** cada 2-3 años para evitar la corrosión y mantener sus propiedades anticongelantes."
                    },
                    {
                        q: "¿Cómo identificar problemas comunes en el carburador o la inyección de combustible?",
                        a: "Los problemas en el **carburador o sistema de inyección** pueden manifestarse de varias maneras: **dificultad para arrancar** (especialmente en frío), **ralentí inestable**, **pérdida de potencia** o aceleración irregular, **consumo excesivo de combustible**, o un **olor fuerte a gasolina**. En carburadores, puede ser suciedad o desajuste; en inyección, pueden ser sensores defectuosos, inyectores sucios o fallos en la bomba de combustible. La limpieza y el ajuste son clave, pero la inyección a menudo requiere diagnóstico profesional."
                    }
                ]
            },
            frenos: {
                title: "Sistema de Frenos",
                questions: [
                    {
                        q: "¿Cuáles son las señales de advertencia de pastillas de freno desgastadas?",
                        a: "Las pastillas de freno desgastadas son un peligro. Las señales de advertencia incluyen: un **chirrido metálico** al frenar (indicador de desgaste audible), una **sensación esponjosa o 'blanda'** en la maneta o pedal de freno, un **recorrido excesivo** de la maneta/pedal, o una **disminución notable en la capacidad de frenado**. Visualmente, puedes ver que el material de fricción está muy delgado o casi ausente."
                    },
                    {
                        q: "¿Con qué frecuencia se debe revisar y reemplazar el líquido de frenos?",
                        a: "El **líquido de frenos** es higroscópico, lo que significa que absorbe humedad del ambiente, lo que reduce su punto de ebullición y puede causar burbujas de aire, disminuyendo la eficacia de frenado. Se debe **revisar el nivel** mensualmente y **reemplazarlo completamente cada 1-2 años**, o según lo indique el manual de tu DM 250 gris. Un líquido de color oscuro o turbio es señal de que necesita ser cambiado."
                    },
                    {
                        q: "¿Cómo se purga el sistema de frenos y cuándo es necesario hacerlo?",
                        a: "Purgar el **sistema de frenos** es el proceso de eliminar el aire atrapado en las líneas de freno, lo cual puede causar una sensación esponjosa y reducir la eficiencia de frenado. Es necesario hacerlo **después de reemplazar componentes** del sistema (como la bomba o los cáliper), **cuando se cambia el líquido de frenos**, o si la maneta/pedal se siente esponjosa debido a la entrada de aire. Es un proceso que requiere cuidado para evitar la reintroducción de aire."
                    },
                    {
                        q: "¿Qué importancia tienen los discos de freno y qué problemas pueden presentar?",
                        a: "Los **discos de freno** son la superficie sobre la que actúan las pastillas para detener la moto. Su importancia radica en proporcionar una superficie de frenado consistente y eficiente. Los problemas comunes incluyen **alabeo o deformación** (causando vibraciones al frenar), **desgaste excesivo** (pueden aparecer surcos o una 'ceja' en el borde del disco), o **fisuras**. Un disco dañado compromete seriamente la seguridad y debe ser reemplazado."
                    },
                    {
                        q: "¿Qué es el sistema ABS y cómo beneficia la seguridad al conducir una moto?",
                        a: "El **Sistema de Frenado Antibloqueo (ABS)** es una característica de seguridad que evita que las ruedas se bloqueen durante una frenada brusca. Monitorea la velocidad de cada rueda y modula la presión de frenado para evitar el derrape incontrolado, permitiéndote mantener el control de la dirección. Beneficia la seguridad al reducir significativamente el riesgo de caídas en situaciones de frenado de emergencia, especialmente en superficies resbaladizas."
                    }
                ]
            },
            ruedas: {
                title: "Neumáticos y Ruedas",
                questions: [
                    {
                        q: "¿Cómo influye la presión correcta de los neumáticos en la seguridad y el rendimiento?",
                        a: "La **presión correcta de los neumáticos** es fundamental. Una presión inadecuada puede llevar a: **desgaste irregular** del neumático, **menor agarre** (especialmente en curvas), **mayor distancia de frenado**, **manejo inestable** (la moto se siente 'flotante' o pesada), y un **mayor consumo de combustible**. Mantener la presión recomendada por el fabricante (consulta el manual o la etiqueta en la moto) asegura una conducción segura, óptima y eficiente."
                    },
                    {
                        q: "¿Cómo se verifica el desgaste de los neumáticos y cuál es el límite legal?",
                        a: "El **desgaste de los neumáticos** se verifica buscando los **indicadores de desgaste (TWI - Tread Wear Indicator)**, que son pequeños tacos elevados dentro de los surcos principales de la banda de rodadura. Cuando la banda de rodadura se desgasta hasta el nivel del TWI, el neumático ha alcanzado su límite legal de desgaste y debe ser reemplazado. También inspecciona si hay **grietas, cortes, bultos o deformaciones** en la superficie."
                    },
                    {
                        q: "¿Cuál es la importancia del balanceo y la alineación de las ruedas?",
                        a: "El **balanceo y la alineación de las ruedas** son cruciales para una conducción suave y segura. Un desequilibrio puede causar **vibraciones** en el manillar o en toda la moto, especialmente a ciertas velocidades, lo que puede ser incómodo y peligroso. Una mala alineación (como en el eje trasero con el delantero) puede causar **desgaste irregular del neumático** y una **conducción inestable**. Se deben revisar cada vez que se cambian los neumáticos o si se sienten vibraciones."
                    },
                    {
                        q: "¿Qué debo saber sobre la vida útil de un neumático, incluso si no tiene mucho desgaste?",
                        a: "Los neumáticos tienen una **vida útil limitada** más allá del desgaste. La goma se degrada con el tiempo debido a la exposición al sol, el calor y los químicos, volviéndose más dura y propensa a agrietarse, perdiendo agarre. La mayoría de los fabricantes recomiendan reemplazar los neumáticos **cada 5 a 7 años**, incluso si tienen mucho dibujo, y **nunca más de 10 años** desde su fecha de fabricación (que se encuentra en el flanco del neumático, el código DOT). Los neumáticos envejecidos pueden fallar repentinamente."
                    }
                ]
            },
            transmision: {
                title: "Transmisión (Cadena/Cardan)",
                questions: [
                    {
                        q: "¿Cómo se realiza la limpieza y lubricación de la cadena de transmisión?",
                        a: "La **limpieza y lubricación de la cadena** es un mantenimiento esencial. Primero, usa un limpiador específico para cadenas de moto y un cepillo (nunca agua a presión) para eliminar la suciedad y grasa vieja. Luego, con la cadena limpia y seca, aplica el lubricante en la parte interior de los eslabones mientras giras lentamente la rueda trasera. Hazlo preferiblemente **cada 500-1000 km** o después de rodar bajo la lluvia. ¡Una cadena limpia y lubricada dura más y funciona mejor!"
                    },
                    {
                        q: "¿Qué holgura debe tener la cadena y por qué es importante mantenerla correctamente tensada?",
                        a: "La **holgura de la cadena** (el juego vertical que tiene) debe ser la especificada en el manual de tu DM 250, generalmente entre 2.5 y 3.5 cm. Una cadena **demasiado tensa** causa un desgaste prematuro de los rodamientos de la caja de cambios y de la rueda, además de dañar la propia cadena. Una cadena **demasiado floja** puede salirse del piñón o la corona, dañar el basculante, o golpear, representando un grave riesgo de seguridad. Revisa la holgura regularmente en varios puntos de la cadena."
                    },
                    {
                        q: "¿Cuáles son las señales de que el kit de arrastre necesita ser reemplazado?",
                        a: "El **kit de arrastre** (cadena, piñón y corona) se desgasta como un conjunto. Las señales de reemplazo incluyen: **dientes de la corona o piñón 'afilados' o con forma de gancho**, **eslabones de la cadena rígidos** o que no se doblan suavemente (puntos duros), la cadena se 'separa' de la corona al tirar de ella en la parte trasera, o un **ruido excesivo** proveniente de la transmisión. Generalmente se reemplazan cada 15,000-30,000 km, pero depende del uso y mantenimiento."
                    },
                    {
                        q: "¿Cómo funciona una transmisión por cardan y qué mantenimiento requiere?",
                        a: "Una **transmisión por cardan** (común en algunas motos, no en la DM 250) usa un eje rotatorio para transferir potencia del motor a la rueda trasera, eliminando la necesidad de cadena. Es más limpia y requiere menos mantenimiento diario. El mantenimiento principal es la **revisión y cambio del fluido del cárter del cardan** (similar al aceite de un diferencial de coche) según el intervalo del fabricante, y la inspección de los fuelles de goma para asegurar que no haya fugas o daños. Ofrece una conducción más suave pero puede ser más pesado y complejo en caso de avería."
                    }
                ]
            },
            electricidad: {
                title: "Sistema Eléctrico y Luces",
                questions: [
                    {
                        q: "¿Qué problemas comunes indican una batería descargada o defectuosa?",
                        a: "Una **batería descargada o defectuosa** puede manifestarse con: **dificultad para arrancar** (el motor de arranque gira lento o no gira), **luces débiles** (faros, intermitentes) al intentar arrancar o incluso con el motor en marcha, **fallos electrónicos** en el tablero o accesorios, o el click del relé de arranque sin que la moto encienda. Las baterías también pueden fallar por sulfatación o por el fin de su vida útil (generalmente 2-5 años)."
                    },
                    {
                        q: "¿Cómo se comprueban y mantienen las luces de la motocicleta?",
                        a: "Para mantener las **luces** de tu moto en óptimas condiciones, debes **revisar regularmente** que todas funcionen: faro delantero (luces altas y bajas), luz de freno (ambos frenos), intermitentes, luz de posición y luz de matrícula. Si una bombilla está fundida, reemplázala. Verifica también los fusibles y las conexiones eléctricas si el problema persiste. Asegúrate de que los faros estén bien ajustados para no deslumbrar y tener buena visibilidad."
                    },
                    {
                        q: "¿Cuál es la función del regulador de voltaje y el estator?",
                        a: "El **regulador de voltaje** y el **estator** trabajan en conjunto para cargar la batería y alimentar el sistema eléctrico de la moto. El **estator** (parte del alternador) genera corriente alterna (AC) a partir de la rotación del motor. El **regulador de voltaje** convierte esa corriente AC en corriente directa (DC) y regula el voltaje para que no exceda los 14-14.5V (evitando sobrecargar la batería y dañar la electrónica). Fallos en estos componentes pueden llevar a una batería descargada o a la quema de bombillas y otros sistemas eléctricos."
                    },
                    {
                        q: "¿Cómo se revisan los fusibles de la moto y cuándo es necesario hacerlo?",
                        a: "Los **fusibles** protegen los circuitos eléctricos de sobrecargas. Debes revisarlos si un componente eléctrico (luces, bocina, tablero) deja de funcionar de repente. Para hacerlo, localiza la caja de fusibles (generalmente cerca de la batería o bajo el asiento), retira cada fusible con unas pinzas especiales (o con cuidado) y revisa visualmente si el filamento interno está roto. Si está roto, reemplázalo por uno del mismo amperaje. Nunca uses un fusible de mayor amperaje, ya que podrías causar un cortocircuito o incendio."
                    }
                ]
            },
            suspension: {
                title: "Suspensión y Chasis",
                questions: [
                    {
                        q: "¿Cómo se detectan fugas en los retenes de la horquilla delantera?",
                        a: "Las **fugas en los retenes de la horquilla delantera** son comunes y se detectan visualmente. Observa si hay **aceite en las barras de la horquilla** (manchas, goteo) o si se acumula suciedad pegajosa en esa zona. También puedes sentir un **tacto inusual** en la suspensión delantera, como que se hunde más rápido o rebota de forma irregular. Una fuga reduce la capacidad de amortiguación y puede llegar a la pinza de freno, comprometiendo la seguridad."
                    },
                    {
                        q: "¿Cuál es la importancia de la precarga, compresión y rebote en los amortiguadores?",
                        a: "La **precarga, compresión y rebote** son ajustes clave en los amortiguadores (especialmente si tu DM 250 tiene suspensión ajustable): <ul><li>**Precarga:** Ajusta la altura inicial de la moto y cuánto se hunde la suspensión con el peso del piloto.</li><li>**Compresión:** Controla la velocidad a la que la suspensión se comprime al pasar por un bache.</li><li>**Rebote:** Controla la velocidad a la que la suspensión se extiende después de haberse comprimido.</li></ul> Ajustar estos parámetros correctamente es vital para la estabilidad, el confort y el manejo de la moto, especialmente al conducir con pasajero, carga o en diferentes terrenos."
                    },
                    {
                        q: "¿Cuándo es necesario engrasar los rodamientos de la dirección y la rueda?",
                        a: "Los **rodamientos de la dirección y de la rueda** deben ser inspeccionados y engrasados periódicamente para asegurar un movimiento suave y libre de fricción. Los de la dirección (cabeza de dirección) se deben revisar si sientes **'clacks' o juego** en el manillar al frenar o si la dirección se siente **dura o con 'escalones'** al girar. Los de las ruedas se revisan si hay **juego lateral** en la rueda. Generalmente, un engrase o reemplazo cada 20,000-40,000 km, o si hay ruidos o juego, es una buena práctica."
                    },
                    {
                        q: "¿Qué importancia tiene el mantenimiento de los bujes del basculante?",
                        a: "Los **bujes del basculante** permiten que el basculante (el brazo que sostiene la rueda trasera) se mueva suavemente arriba y abajo. Su mantenimiento es importante porque si se desgastan o se secan, pueden causar **juego excesivo en la rueda trasera**, **inestabilidad** en la conducción y **desgaste irregular del neumático**. Deben ser inspeccionados y engrasados (si son lubricables) o reemplazados si presentan juego, lo cual se siente como una 'flojedad' en la parte trasera de la moto."
                    }
                ]
            },
            combustible: {
                title: "Sistema de Combustible",
                questions: [
                    {
                        q: "¿Cuál es el mantenimiento recomendado para el filtro de aire y por qué es importante?",
                        a: "El **filtro de aire** es la 'nariz' de tu motor. Su mantenimiento es crucial porque evita que el polvo, la suciedad y otras partículas abrasivas entren en el motor y causen daños internos. Un filtro de aire sucio restringe el flujo de aire, lo que puede llevar a una **pérdida de potencia, mayor consumo de combustible y un funcionamiento irregular** del motor. Debe limpiarse o reemplazarse según las indicaciones del manual de tu DM 250, a menudo cada 5,000-10,000 km o más frecuentemente en ambientes polvorientos."
                    },
                    {
                        q: "¿Qué precauciones se deben tomar al almacenar la moto por periodos prolongados?",
                        a: "Almacenar la moto por periodos prolongados requiere precauciones para evitar problemas: <ul><li>**Tanque de combustible:** Llénalo hasta arriba con gasolina y un estabilizador de combustible para evitar la oxidación y la degradación del combustible.</li><li>**Batería:** Desconecta los terminales o usa un cargador mantenedor.</li><li>**Neumáticos:** Inflarlos a su presión máxima y si es posible, usa soportes para que las ruedas no toquen el suelo y evitar deformaciones.</li><li>**Limpieza:** Lava y encera la moto para proteger la pintura y las superficies metálicas.</li><li>**Cubierta:** Usa una funda transpirable para protegerla del polvo y la humedad.</li></ul>"
                    },
                    {
                        q: "¿Qué es el sistema de combustible de inyección electrónica y sus ventajas?",
                        a: "El **sistema de inyección electrónica de combustible** es un sistema más avanzado que el carburador, donde un ordenador (ECU) controla con precisión la cantidad de combustible que se inyecta en el motor. Sus ventajas incluyen: **mayor eficiencia de combustible**, **arranque más fácil** en frío, **mejor rendimiento** a diferentes altitudes y temperaturas, **menores emisiones contaminantes**, y una **respuesta del acelerador más suave y precisa**. También es más fácil de diagnosticar con herramientas electrónicas."
                    }
                ]
            },
            revisiones: {
                title: "Revisiones Generales",
                questions: [
                    {
                        q: "¿Cuáles son los puntos clave a revisar antes de cada viaje en moto?",
                        a: "Antes de cada viaje, especialmente si es largo, revisa: <ul><li>**Niveles:** Aceite de motor, líquido de frenos, refrigerante.</li><li>**Neumáticos:** Presión y estado general (desgaste, cortes).</li><li>**Frenos:** Funcionamiento (delantero y trasero), tacto de la maneta/pedal.</li><li>**Luces:** Faros, luz de freno, intermitentes, luz de matrícula.</li><li>**Cadena:** Tensión y lubricación.</li><li>**Bocina:** Funcionamiento.</li><li>**Espejos:** Bien ajustados.</li></ul> Un chequeo rápido puede prevenir muchos problemas."
                    },
                    {
                        q: "¿Con qué frecuencia se debe realizar una revisión completa por un profesional?",
                        a: "Una **revisión completa por un profesional** debe realizarse según los intervalos de mantenimiento recomendados en el manual de tu DM 250 gris, generalmente **cada 6,000 a 12,000 kilómetros** o anualmente, lo que ocurra primero. Estas revisiones van más allá de lo básico y pueden incluir ajuste de válvulas, sincronización de carburadores/cuerpos de inyección, inspección profunda de rodamientos, holguras, sistema eléctrico, etc., asegurando que todos los sistemas funcionen correctamente."
                    },
                    {
                        q: "¿Qué herramientas básicas debe tener todo motociclista en casa?",
                        a: "Para el mantenimiento básico en casa, todo motociclista debería tener: <ul><li>**Juego de llaves (fijas, de vaso)**</li><li>**Destornilladores** (planos y de estrella)</li><li>**Alicates** (universales, de corte)</li><li>**Llave de bujías**</li><li>**Medidor de presión de neumáticos**</li><li>**Aceite para cadena y limpiador de cadena**</li><li>**Aceite de motor y embudo**</li><li>**Líquido de frenos**</li><li>**Linterna**</li><li>**Trapos y guantes**</li><li>**Manual de servicio de tu moto**</li></ul> Estas herramientas te permitirán realizar las tareas básicas y detectar problemas a tiempo."
                    }
                ]
            }
        };

        function showMechanicCategory(category) {
            const contentBox = document.getElementById('mechanicGuideContent');
            const selectedCategory = mechanicCategories[category];

            if (!selectedCategory) {
                contentBox.innerHTML = '<p>Lo siento, esa categoría no existe en mi base de datos. Por favor, selecciona una de las opciones.</p>';
                return;
            }

            let htmlContent = `<h3><i class="fas fa-tools"></i> ${selectedCategory.title}</h3>`;
            htmlContent += `<p>Aquí tienes algunas preguntas comunes y respuestas detalladas sobre ${selectedCategory.title.toLowerCase()}:</p>`;
            htmlContent += '<ul>';
            selectedCategory.questions.forEach((q, index) => {
                htmlContent += `<li><a href="javascript:void(0);" onclick="displayMechanicAnswer('${category}', ${index})"><b>${q.q}</b></a></li>`;
            });
            htmlContent += '</ul>';
            htmlContent += `<div id="mechanicAnswer" style="margin-top: 20px; padding: 15px; border-radius: 8px; background-color: rgba(0, 255, 251, 0.1); border: 1px solid var(--neon-cyan); text-align: left; display: none; transition: background-color 0.5s ease, border-color 0.5s ease; color: #e0e0e0;"></div>`;

            contentBox.innerHTML = htmlContent;
            contentBox.style.display = 'block';

            if (document.body.classList.contains('light-mode')) {
                const answerBox = document.getElementById('mechanicAnswer');
                if (answerBox) {
                    answerBox.style.backgroundColor = 'rgba(255, 0, 200, 0.1)';
                    answerBox.style.borderColor = 'var(--neon-magenta)';
                    answerBox.style.color = '#333';
                }
            }
        }

        function displayMechanicAnswer(category, questionIndex) {
            const answerBox = document.getElementById('mechanicAnswer');
            const selectedCategory = mechanicCategories[category];

            if (selectedCategory && selectedCategory.questions[questionIndex]) {
                answerBox.innerHTML = `<p>${selectedCategory.questions[questionIndex].a}</p>`;
                answerBox.style.display = 'block';
                answerBox.scrollIntoView({ behavior: 'smooth', block: 'nearest' });
            }
        }

        function toggleDarkMode() {
            const body = document.body;
            const modeToggleText = document.getElementById('modeToggleText');
            const modeToggleIcon = document.getElementById('modeToggleIcon');

            body.classList.toggle('light-mode');
            body.classList.toggle('dark-mode');

            if (body.classList.contains('light-mode')) {
                modeToggleText.textContent = 'Modo Claro';
                modeToggleIcon.classList.remove('fa-moon');
                modeToggleIcon.classList.add('fa-sun');
            } else {
                modeToggleText.textContent = 'Modo Oscuro';
                modeToggleIcon.classList.remove('fa-sun');
                modeToggleIcon.classList.add('fa-moon');
            }
            updateNeonColors();
        }

        function updateNeonColors() {
            const root = document.documentElement;
            if (document.body.classList.contains('light-mode')) {
                root.style.setProperty('--neon-cyan', '#ff00c8');
                root.style.setProperty('--neon-magenta', '#00fffb');
                root.style.setProperty('--neon-yellow', '#007bff');
                root.style.setProperty('--neon-blue', '#fcff00');
                root.style.setProperty('--neon-green', '#ff0000');
                root.style.setProperty('--neon-red', '#00ff00');

                document.querySelector('.ad-container').style.borderColor = 'var(--neon-magenta)';
                document.querySelector('.ad-header').style.borderColor = 'var(--neon-magenta)';
                document.querySelector('.profile-pic-container').style.borderColor = 'var(--neon-cyan)';
                document.querySelector('.javier-entertainment-section').style.borderColor = 'var(--neon-magenta)';
                document.querySelector('.my-adventures-section').style.borderColor = 'var(--neon-magenta)';

                const answerBox = document.getElementById('mechanicAnswer');
                if (answerBox) {
                    answerBox.style.backgroundColor = 'rgba(255, 0, 200, 0.1)';
                    answerBox.style.borderColor = 'var(--neon-magenta)';
                    answerBox.style.color = '#333';
                }

            } else {
                root.style.setProperty('--neon-cyan', '#00fffb');
                root.style.setProperty('--neon-magenta', '#ff00c8');
                root.style.setProperty('--neon-yellow', '#fcff00');
                root.style.setProperty('--neon-blue', '#007bff');
                root.style.setProperty('--neon-green', '#00ff00');
                root.style.setProperty('--neon-red', '#ff0000');

                document.querySelector('.ad-container').style.borderColor = 'var(--neon-cyan)';
                document.querySelector('.ad-header').style.borderColor = 'var(--neon-cyan)';
                document.querySelector('.profile-pic-container').style.borderColor = 'var(--neon-magenta)';
                document.querySelector('.javier-entertainment-section').style.borderColor = 'var(--neon-cyan)';
                document.querySelector('.my-adventures-section').style.borderColor = 'var(--neon-cyan)';

                const answerBox = document.getElementById('mechanicAnswer');
                if (answerBox) {
                    answerBox.style.backgroundColor = 'rgba(0, 255, 251, 0.1)';
                    answerBox.style.borderColor = 'var(--neon-cyan)';
                    answerBox.style.color = '#e0e0e0';
                }
            }
        }

        document.addEventListener('DOMContentLoaded', updateNeonColors);
    </script>
</body>
</html>
