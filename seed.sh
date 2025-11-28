#!/bin/bash

echo "⣯ Installing dependencies"
apt-get update;
apt-get install jq -y;

echo "⣯ Starting to seed features from JSON"

cat /features.json | jq -c '.feature_flags[]' | while read -r feature; do
    name=$(echo "$feature" | jq -r '.name')
    description=$(echo "$feature" | jq -r '.description // ""' | sed "s/'/''/g")
    enabled=$(echo "$feature" | jq -r '.active // false')

    psql -h db -U $POSTGRES_USER -d $POSTGRES_DB -q <<-EOSQL
        INSERT INTO features (name, description, created_by_user_id)
        VALUES ('$name', '$description', 1)
        ON CONFLICT (name) DO NOTHING;
EOSQL
    
    psql -h db -U $POSTGRES_USER -d $POSTGRES_DB -q <<-EOSQL
        INSERT INTO feature_environments (environment, feature_name, enabled)
        VALUES ('development', '$name', $enabled)
        ON CONFLICT (environment, feature_name) DO UPDATE SET enabled = $enabled;
EOSQL
    
    echo "✓ Seeded: $name"
done

echo "✓ Seeding complete!"
