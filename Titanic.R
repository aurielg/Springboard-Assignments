# Check out the structure of titanic
str(titanic)

# Use ggplot() for the first instruction
ggplot(titanic, aes(x=factor(Pclass), fill=factor(Sex))) +
  geom_bar(position="dodge")


# Use ggplot() for the second instruction
ggplot(titanic, aes(x=factor(Pclass), fill=factor(Sex))) +
  geom_bar(position="dodge") 

# Position jitter (use below)
posn.j <- position_jitter(0.5, 0)

# Use ggplot() for the last instruction
ggplot(titanic, aes(x=factor(Pclass), y=Age, col=factor(Sex))) +
  geom_jitter(position=posn.j, alpha=.5, size=3) + 
  facet_grid(".~Survived")

