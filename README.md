
## Self-Healing Infrastructure
<p>This project demonstrates a self-healing infrastructure that detects and recovers from service failures using Prometheus, Alertmanager, and Ansible.
</p>
 <h2>🎯 Objective</h2>
<ul>
    <li>Monitor a service (NGINX) using <strong>Prometheus</strong>.</li>
    <li>Trigger alerts via <strong>Alertmanager</strong>.</li>
    <li>Automatically restart the service using an <strong>Ansible playbook</strong>.</li>
  </ul>
 <h2>🛠 Requirements</h2>
  <ul>
    <li>Docker and Docker Compose</li>
    <li>Ansible (for manual playbook testing)</li>
  </ul>
 <h2>🚀 Setup</h2>
  <ol>
    <li><strong>Configure the files </strong>
    <li><strong>Start the infrastructure:</strong>
      <pre><code>docker compose up -d --build</code></pre>
    </li>
    <li><strong>Access Prometheus:</strong> <a href="http://localhost:9090" target="_blank">http://localhost:9090</a></li>
    <li><strong>Simulate a failure:</strong>
      <pre><code>docker stop nginx</code></pre>
    </li>
    <li><strong>Observe auto-healing:</strong> Prometheus will fire an alert → Alertmanager calls Webhook → Webhook triggers Ansible → NGINX restarts.</li>
    <li><strong>Check NGINX recovery:</strong> Visit <a href="http://localhost:8080" target="_blank">http://localhost:8080</a></li>
  </ol>
<h2>📁 Configuration Files</h2>
  <ul>
    <li><code>docker-compose.yml</code> – defines services (Prometheus, Alertmanager, NGINX, Webhook)</li>
    <li><code>prometheus.yml</code> – Prometheus scrape config</li>
    <li><code>alertmanager.yml</code> – Alert routing to Webhook</li>
    <li><code>alerts.yml</code> – Alerting rules</li>
    <li><code>webhook_receiver.py</code> – Flask app receiving the alert</li>
    <li><code>nginx_restart.yml</code> – Ansible playbook to restart NGINX</li>
  </ul>

  <h2>🐞 Troubleshooting</h2>
  <ul>
    <li>Prometheus not firing? Make sure <code>alerts.yml</code> is loaded and <code>up{job="nginx"}</code> shows 0.</li>
    <li>Webhook not called? Check <code>docker logs webhook</code>.</li>
    <li>NGINX not restarting? Make sure Docker CLI is installed in the webhook container and socket is mounted.</li>
  </ul>

  <h2>✅ Conclusion</h2>
  <p>
    You've now built an automated recovery system for service outages using Prometheus, Alertmanager, Ansible, and Docker.
    Deploy, monitor, heal — all hands-free! 🚀
  </p>
</body>
</html>



