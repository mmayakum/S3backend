module.exports = {
  branches: "main",
  repositoryUrl: "https://github.com/Ikomo007/s3Backend.git",
  plugins: [
    '@semantic-release/commit-analyzer',
    '@semantic-release/release-notes-generator',
    '@semantic-release/git',
    '@semantic-release/github']
   }