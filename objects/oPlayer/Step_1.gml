if (currentHealth <= 0) game_restart();
cooldown_aoe = max(0,cooldown_aoe-1);
cooldown_fireball = max(0,cooldown_fireball-1);