# Use the Microsoft SQL Server Image as the base
FROM mcr.microsoft.com/mssql/server:2022-latest

# Set environment variables for SQL Server
ENV ACCEPT_EULA=Y
ENV MSSQL_PID=Express
ENV MSSQL_SA_PASSWORD=Password1!

# Switch to root for dictory creation and additional setup
USER root
RUN mkdir -p /app/init-scripts && chown mssql /app/init-scripts

# Copy the initialization SQL script to the container
COPY ./ChickDB/init-database.sql /app/init-scripts/

# Ensure mssql-tools are in the PATH
ENV PATH="$PATH:/opt/mssql-tools18/bin"

# Revert to default SQL Server user for security
USER mssql

# Healthcheck to ensure SQLServer is ready
HEALTHCHECK --interval=10s --timeout=5s --start-period=30s --retries=5 \
    CMD /opt/mssql-tools18/bin/sqlcmd -S localhost -U sa -P "$MSSQL_SA_PASSWORD" -C -Q "SELECT 1" || exit 1

# Start SQL Server and run the initialization script
# Added -C to sqlcmd to handle SSL certificate trust in newer images
CMD /bin/bash -c "/opt/mssql/bin/sqlservr & \
sleep 25 && \
if /opt/mssql-tools18/bin/sqlcmd -S localhost -U SA -P '$MSSQL_SA_PASSWORD' -C -Q 'SELECT name FROM sys.databases WHERE name = \"Farm\"' | grep -q 'Farm'; then \
  echo 'Database already exists'; \
else \
    echo 'Initializing Database'; \
    /opt/mssql-tools18/bin/sqlcmd -S localhost -U SA -P '$MSSQL_SA_PASSWORD' -C -d master -i /app/innit-scripts/init-database.sql; \
fi && wait"