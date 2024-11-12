# Use the official PHP image with Apache support
FROM php:8.0-apache

# Enable mod_rewrite for Apache
RUN a2enmod rewrite

# Set working directory in the container
WORKDIR /var/www/html

# Copy your PHP code into the working directory
COPY . /var/www/html

# Install any additional PHP extensions your application might need
# e.g., pdo, mysqli, etc.
RUN docker-php-ext-install pdo pdo_mysql

# Set appropriate file permissions for Apache
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

# Expose the port Apache is running on
EXPOSE 80

# Restart Apache to make sure all configurations are loaded
CMD ["apache2-foreground"]
