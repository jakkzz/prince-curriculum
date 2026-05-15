# Phase 5 Week 1 Quiz — VPS & Linux fundamentals

> ✏️ **Student version.** Answers and explanations live in the mentor's notebook. Try every question; show your answers on the Friday call. Honest attempt beats lucky guess.

> 🎯 **What this tests.** ssh, sudoers, ufw, fail2ban, systemd, journalctl, basic Linux ops.

>
> **Time:** 30–45 min. No AI tools.
> **Passing:** 20 / 27.

## Section A — Multiple choice

**A1.** Why disable root ssh?

**A2.** Why disable password auth on ssh?

**A3.** What does `ufw allow ssh` do?

**A4.** Why enable firewall AFTER allowing ssh?

**A5.** What's `fail2ban`?

**A6.** `systemctl status nginx` — what does it show?

**A7.** Why systemd over `nohup` or `tmux`?

**A8.** `journalctl -u app -f` — what?

**A9.** Why use a non-root user for the app?

**A10.** `df -h` and the root filesystem is 100% full — what first?

## Section B — Predict the output

**B1.**

```
ssh -i ~/.ssh/id_ed25519 root@1.2.3.4
```

**B2.**

```
sudo systemctl enable --now nginx
```

**B3.**

```
sudo ufw status verbose
```

**B4.**

```
sudo journalctl -u my-app.service --since '10 minutes ago'
```

**B5.**

```
id deploy
```

**B6.**

```
chmod 600 ~/.ssh/authorized_keys
```

## Section C — Fill in the missing code

**C1.** Create a non-root user with sudo + ssh key.

**C2.** Disable root + password ssh.

**C3.** Enable basic firewall.

**C4.** Minimal systemd unit.

**C5.** Tail logs for app.

**C6.** Install fail2ban.

## Section D — Find the bug

**D1.**

```
sudo ufw enable
# ufw warns about ssh — you press y
# Now you can't reconnect
```

**D2.**

```
sudo systemctl status myapp
# Result: code=exited, status=1/FAILURE
```

**D3.**

```
ssh deploy@1.2.3.4
# Permission denied (publickey)
```

## Section E — Write the code

**E1.** Full new-VPS hardening script.

**E2.** systemd unit for FastAPI app via uvicorn.

**E3.** Show open ports.

## Score yourself

- **A**: __ / 10  · **B**: __ / 6  · **C**: __ / 6  · **D**: __ / 3  · **E**: __ / 3

**Total: __ / 27**

Log score in `learning-log/`. 20+ to advance.
