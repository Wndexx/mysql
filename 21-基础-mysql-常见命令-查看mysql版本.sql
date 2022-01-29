-- 查看 mysql 版本

    -- 方法一

        -- select version();

    -- 方法二

        -- mysql --version （dos 命令，不是 sql　命令）

            -- 需要先退出 mysql 客户端

            -- 可以简写成 mysql -V

            -- mysql  Ver 14.14 Distrib 5.5.15, for Win32 (x86)



select version();

-- +-----------+
-- | version() |
-- +-----------+
-- | 5.5.15    |
-- +-----------+
-- 1 row in set (0.00 sec)
