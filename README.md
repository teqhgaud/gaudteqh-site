Gaudteqh Electronics — Static Website

This is a small, responsive static site intended for the domain gaudteqh.com.

Files:
- index.html — Home / landing page
- about.html — About and mission
- services.html — Services offered
- contact.html — Contact form (client-side only)
- assets/css/styles.css — Styles
- assets/js/app.js — Minimal client-side behavior
- assets/img — Place for images and icons

Quick deploy (GitHub Pages)
1. Create a new GitHub repository and push this folder as the repository root on the `main` branch.
2. The repository already contains a `CNAME` file with `gaudteqh.com`. Keep that in the root.
3. The included GitHub Actions workflow (`.github/workflows/publish.yml`) will publish the repository to GitHub Pages automatically when you push to `main`.
4. In the repository settings → Pages, confirm the Pages deployment and domain. After the Action runs, your site should be served from `https://gaudteqh.com` (once DNS is configured).

DNS setup checklist
- Add an A record pointing your domain to GitHub Pages IP addresses or configure an ALIAS/ANAME depending on your DNS provider. GitHub Pages IPs (as of writing) are documented by GitHub — use their authoritative docs for exact IPs.
- Ensure the `CNAME` file contains only `gaudteqh.com` (no extra spaces or lines).
- Wait for DNS propagation (can take up to 48 hours, usually faster).

Forms (Netlify Forms + Formspree)
- The contact form is set up for Netlify Forms by default. To enable:
  1. Deploy the site to Netlify (drag & drop the folder or connect your repo).
  2. Netlify will auto-detect the form by the `data-netlify="true"` attribute and `form-name` hidden field.
  3. Test submissions from the live site and view them in Netlify > Forms.

- Fallback with Formspree:
  1. Sign up at https://formspree.io/ and create a form endpoint.
  2. Set the `action` attribute on the form in `contact.html` to your Formspree URL (e.g. `https://formspree.io/f/abcd1234`) and add `method="POST"`.
  3. (Optional) Remove Netlify-specific attributes if you won't use Netlify.

Automated deployment script (PowerShell)
- `deploy.ps1` will initialize a git repo (if needed), add files, commit, and push to a remote you provide. See the script in the repo root.

Branding
- Replace placeholder images in `assets/img` and update contact information in footer and contact page.

License: MIT
