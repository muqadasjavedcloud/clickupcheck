# Use Node official image
FROM node:22

# Set working directory
WORKDIR /app

# Copy package files and install dependencies
COPY package*.json ./
RUN npm install

# Copy all project files
COPY . .

# Install browsers for Playwright
RUN npx playwright install --with-deps

# Run Playwright tests by default
# By default, run Cypress tests on container start
CMD ["npx", "cypress", "run", "--spec", "cypress/e2e/**/*.cy.js"]
