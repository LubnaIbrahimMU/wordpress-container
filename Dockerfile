# Use the official WordPress image from the Docker Hub
FROM wordpress:latest

# Copy the repo to the container
COPY . /var/www/html


# # Set environment variables for MySQL
# ENV WORDPRESS_DB_HOST=db:3306
# ENV WORDPRESS_DB_USER=wordpressuser
# ENV WORDPRESS_DB_PASSWORD=wordpresspassword
# ENV WORDPRESS_DB_NAME=wordpress

# Expose port 80
EXPOSE 80


# Start Apache in the foreground
CMD ["apache2-foreground"]