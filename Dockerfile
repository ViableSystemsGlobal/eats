FROM php:8.2-fpm

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    libzip-dev \
    libicu-dev \
    zip \
    unzip \
    nodejs \
    npm \
    && rm -rf /var/lib/apt/lists/*

# Install PHP extensions
RUN docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd zip intl

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Set working directory
WORKDIR /app

# Copy application files
COPY . .

# Create necessary directories and set permissions BEFORE composer install
RUN mkdir -p bootstrap/cache \
    storage/framework/cache \
    storage/framework/sessions \
    storage/framework/views \
    storage/logs \
    && chmod -R 777 bootstrap/cache storage

# Install dependencies
RUN composer install --no-dev --optimize-autoloader --no-interaction

# Install NPM dependencies and build assets
RUN npm install && npm run build

# Verify assets were built
RUN ls -la public/build/ || echo "Assets not found"

# Set permissions again after install
RUN chown -R www-data:www-data /app/storage /app/bootstrap/cache /app/public/build \
    && chmod -R 775 /app/storage /app/bootstrap/cache /app/public/build

# Expose port
EXPOSE 8000

# Start command - use artisan serve for EasyPanel compatibility
# If EasyPanel uses PHP-FPM with Nginx, change this to: CMD ["php-fpm"]
CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=8000"]

