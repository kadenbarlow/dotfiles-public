vim.g.db_ui_use_nerd_fonts = 1
vim.g.db_ui_auto_execute_table_helpers = 1
vim.g.db_ui_force_echo_notifications = 1
vim.g.db_ui_hide_schemas = {"pg_catalog", "pg_toast.*"}

vim.g.db_ui_table_helpers = {
    postgresql = {
        List = [[SELECT * FROM "{table}" ORDER BY id DESC LIMIT 50;]],
        Insert = [[
SELECT string_agg(quote_ident(column_name), ', ' ORDER BY ordinal_position)
FROM information_schema.columns
WHERE table_name = '{table}' AND table_schema = '{dbname}';

INSERT INTO "{dbname}"."{table}" ()
VALUES ();]],
        Summary = [[
SELECT column_name, column_default, is_nullable, udt_name, character_maximum_length
FROM information_schema.columns where table_name='{table}' AND table_schema='{dbname}';

SELECT
  indexname,
  (substring(indexdef from 'USING (.*?) ')) AS algorithm,
  (CASE WHEN indexdef LIKE 'CREATE UNIQUE%' THEN true ELSE false END) as unique,
  (substring(indexdef from '\((.*)\)')) AS columns,
  indexdef
FROM pg_indexes
where tablename='affiliatedTechWebhookIntegrations' and schemaname='public';

SELECT tc.constraint_name, tc.table_name, kcu.column_name, ccu.table_name AS foreign_table_name, ccu.column_name AS foreign_column_name, rc.update_rule, rc.delete_rule
FROM
    information_schema.table_constraints AS tc
    JOIN information_schema.key_column_usage AS kcu ON tc.constraint_name = kcu.constraint_name
    JOIN information_schema.referential_constraints AS rc ON tc.constraint_name = rc.constraint_name
    JOIN information_schema.constraint_column_usage AS ccu ON ccu.constraint_name = tc.constraint_name
WHERE constraint_type = 'FOREIGN KEY'
AND tc.table_name = '{table}'
AND tc.table_schema = '{dbname}';

SELECT tc.constraint_name, tc.table_name, kcu.column_name, ccu.table_name AS foreign_table_name, ccu.column_name AS foreign_column_name, rc.update_rule, rc.delete_rule
FROM information_schema.table_constraints AS tc
    JOIN information_schema.key_column_usage AS kcu ON tc.constraint_name = kcu.constraint_name
    JOIN information_schema.referential_constraints AS rc ON tc.constraint_name = rc.constraint_name
   JOIN information_schema.constraint_column_usage AS ccu ON ccu.constraint_name = tc.constraint_name
WHERE constraint_type = 'FOREIGN KEY'
AND ccu.table_name = '{table}'
AND tc.table_schema = '{dbname}';]]
    }
}
