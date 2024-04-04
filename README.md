# Stirling PDF

Stirling PDF is an open-source tool to create, modify and convert PDF files. 

List of all features: https://github.com/Stirling-Tools/Stirling-PDF?tab=readme-ov-file#pdf-features

Stirling PDF website: https://github.com/Stirling-Tools/Stirling-PDF/

## Install

```bash
ddev get b13/ddev-stirling-pdf && ddev restart
```

Add the `.ddev/stirling-pdf/extraConfigs/settings.yml` and `.ddev/stirling-pdf/extraConfigs/stirling-pdf-DB.mv.db` to the repository.
`stirling-pdf-DB.mv.db` contains the API key, so it is recommended to have it in git so it can be shared across a team.

* Stirling PDF UI: `https://<project-name>.ddev.site:8064/`
* SwaggerUI (API): `https://<project-name>.ddev.site:8064/swagger-ui/`

## Additional language packs

For OCR, you may want to add additional languages as described [here](https://github.com/Stirling-Tools/Stirling-PDF/blob/main/HowToUseOCR.md#language-packs).
Don't forget to include these language packs in git.

## API Key

After start, see `.ddev/stirling-pdf/extraConfigs/settings.yml` -> AutomaticallyGenerated -> key 
to get the API Key 

## Login

Authentication is enabled by default 
(`DOCKER_ENABLE_SECURITY=true` and `SECURITY_ENABLE_LOGIN=true`).

User: `stirling`

Password: `stirling`

**Maintained by [@b13](https://github.com/b13)**
